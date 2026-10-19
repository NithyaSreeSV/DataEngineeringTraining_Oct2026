import csv
import json
import pandas as pd
import numpy as np


DATA_DIR = "../data"
OUTPUT_DIR = "../output"

# 1. Load Data
def load_data(data_dir):
    data = {}

    for name in ["suppliers", "products", "inventory", "orders"]:
        with open (f"{data_dir}/{name}.csv") as file:
            list(csv.reader(file))
        data[name] = pd.read_csv(f"{data_dir}/{name}.csv")

    with open(f"{data_dir}/shipment_events.json") as file:
        data["events"] = pd.DataFrame(json.load(file))

    return data

# 2. Clean data and format dates using pandas
def clean_data(orders):

    # Drop duplicate shipment records
    cleaned = orders.drop_duplicates("shipment_id").copy()

    # Clean and convert dates
    date_columns = ["order_date", "expected_date", "actual_date"]
    for column in date_columns:
        cleaned[column] = pd.to_datetime(cleaned[column], errors="coerce")

    # Clean and fill missing values in quantity and shipment_status columns
    cleaned["quantity"] = pd.to_numeric(cleaned["quantity"], errors="coerce")
    cleaned["quantity"] = cleaned["quantity"].fillna(0)
    cleaned["shipment_status"] = cleaned["shipment_status"].fillna("Unknown")
    cleaned = cleaned[cleaned["quantity"] > 0].copy()

    # Create delay_days and is_delayed columns
    cleaned["delay_days"] = (cleaned["actual_date"] - cleaned["expected_date"]).dt.days
    cleaned["delay_days"] = cleaned["delay_days"].fillna(0).clip(lower=0)
    cleaned["is_delayed"] = np.where((cleaned["delay_days"] > 0),1,0,)

    return cleaned

# 3. Perform calculations and Create reports using numpy
def create_supplier_summary(orders, suppliers):
    # Create a Supplier report based on delayed shipments.
    return (
        orders.merge(suppliers, on="supplier_id", how="left")
        .groupby(
            ["supplier_id", "supplier_name", "risk_tier"],
            dropna=False,
        )
        .agg(
            shipment_count=("shipment_id", "count"),
            delayed_shipments=("is_delayed", "sum"),
            units=("quantity", "sum"),
        )
        .reset_index()
        .sort_values(
            ["delayed_shipments", "shipment_count"],
            ascending=False,
        )
    )

def create_inventory_report(inventory):
    # Check the Quantity level and Mark Low stocks.
    report = inventory.copy()
    report["quantity_on_hand"] = pd.to_numeric(
        report["quantity_on_hand"], errors="coerce"
    ).fillna(0)
    report["reorder_level"] = pd.to_numeric(
        report["reorder_level"], errors="coerce"
    ).fillna(0)
    report["stock_status"] = np.where(
        report["quantity_on_hand"] < report["reorder_level"],
        "REORDER",
        "OK",
    )

    return report

def create_delivery_status_report(events):
    # Count the delivery event types.
    if events.empty or "event_type" not in events.columns:
        return pd.DataFrame(columns=["delivery_issue", "event_count"])

    report = (
        events["event_type"]
        .fillna("Unknown")
        .value_counts()
        .rename_axis("delivery_status")
        .reset_index(name="event_count")
    )
    return report

def run(data_dir=DATA_DIR, output_dir=OUTPUT_DIR):
    # Run the supply-chain pipeline, save the reports, and print the results.
    print("=" * 60)
    print("SUPPLY CHAIN MONITORING AND OPTIMIZATION PIPELINE")
    print("=" * 60)

    print("\n[1] Loading supply-chain data")
    data = load_data(data_dir)
    print(f"Shipments loaded: {len(data['orders'])} records")

    print("\n[2] Cleaning shipment data")
    shipments = clean_data(data["orders"])
    print(f"Shipments retained: {len(shipments)} records")

    # NumPy calculations
    supplier_summary = create_supplier_summary(shipments, data["suppliers"])
    inventory_report = create_inventory_report(data["inventory"])
    low_stock = inventory_report.query("stock_status == 'REORDER'")

    # Pandas aggregation and report generation
    delivery_status_report = create_delivery_status_report(data["events"])

    summary = {
        "shipments_processed": int(len(shipments)),
        "delayed_or_overdue_shipments": int(shipments["is_delayed"].sum()),
        "low_stock_rows": int(len(low_stock)),
        "units_shipped": int(shipments["quantity"].sum()),
    }

    with open(f"{output_dir}/run_summary.json", "w") as file:
        json.dump(summary, file, indent=2)

    # 4. Display the cleaned and processed data
    print("\n" + "-" * 60)
    print("RUN SUMMARY")
    print("-" * 60)
    print(json.dumps(summary, indent=2))

    print("\n" + "-" * 60)
    print("SUPPLIER-LEVEL SUMMARY (Pandas Aggregations)")
    print("-" * 60)
    print(supplier_summary.to_string(index=False))

    print("\n" + "-" * 60)
    print("INVENTORY STOCK STATUS REPORT (NumPy Calculations)")
    print("-" * 60)
    print(inventory_report.to_string(index=False))

    print("\n" + "-" * 60)
    print("REORDER RECOMMENDATIONS")
    print("-" * 60)
    if low_stock.empty:
        print("No products require reordering.")
    else:
        print(low_stock.to_string(index=False))

    print("\n" + "-" * 60)
    print("DELIVERY STATUS REPORT (Pandas Aggregations)")
    print("-" * 60)
    print(delivery_status_report.to_string(index=False))
    return summary


if __name__ == "__main__":
    run()