import csv
import json
import pandas as pd
import numpy as np


DATA_DIR = "../data"
OUTPUT_DIR = "../output"

# 1. Load Data
def load_data(data_dir):
    data = {}

    for name in ["customers", "delivery_status", "orders"]:
        with open (f"{data_dir}/{name}.csv") as file:
            list(csv.reader(file))
        data[name] = pd.read_csv(f"{data_dir}/{name}.csv")

    return data

# 2. Clean missing fields and convert timestamps
def clean_data(data):
    # 1. Date fields formatting
    date_columns = {
        "orders": ["order_date"],
        "delivery_status": ["promised_date", "delivered_date", "last_updated"],
    }
    for table_name, columns in date_columns.items():
        for column in columns:
            data[table_name][column] = pd.to_datetime(
                data[table_name][column],
                errors="coerce",
            )

    # 2. Remove Duplicates
    customers = data["customers"].drop_duplicates("customer_id").copy()
    orders = data["orders"].drop_duplicates("order_id").copy()
    delivery = data["delivery_status"].drop_duplicates("delivery_id").copy()

    # 3. Fill missing fields
    orders["order_total"] = pd.to_numeric(orders["order_total"], errors="coerce").fillna(0)
    orders["order_status"] = orders["order_status"].fillna("Unknown")
    delivery["issue_type"] = delivery["issue_type"].fillna("No issue reported")
    delivery["delivery_status"] = delivery["delivery_status"].fillna("Unknown")

    # 4. Join the dataframes to get the big picture
    merged = (
        orders.merge(
            customers[["customer_id", "customer_name", "region"]],
            on="customer_id",
            how="left",
            suffixes=("", "_customer"),
        )
        .merge(
            delivery[
                [
                    "order_id",
                    "promised_date",
                    "delivered_date",
                    "delivery_status",
                    "issue_type",
                ]
            ],
            on="order_id",
            how="left",
        )
    )
    merged["customer_name"] = merged["customer_name"].fillna("Unknown customer")
    merged["region"] = merged["region"].fillna("Unknown")

    # 5. Extract Month
    merged["order_month"] = merged["order_date"].dt.month

    # 6. Calculate delivery delays
    merged["delay_days"] = (merged["delivered_date"] - merged["promised_date"]).dt.days.fillna(0).clip(lower=0)
    merged["is_delayed"] = np.where(
        (merged["delay_days"] > 0),
        1,
        0,
    )

    return merged

def clean_data(data):
    # Remove Duplicates.
    customers = data["customers"].drop_duplicates("customer_id").copy()
    orders = data["orders"].drop_duplicates("order_id").copy()
    delivery = data["delivery_status"].drop_duplicates("order_id").copy()

    # 2. Date fields formatting
    orders["order_date"] = pd.to_datetime(orders["order_date"], errors="coerce")

    for column in ["promised_date", "delivered_date", "last_updated"]:
        delivery[column] = pd.to_datetime(delivery[column], errors="coerce")

    # Fill missing fields.
    orders["order_total"] = pd.to_numeric(orders["order_total"],errors="coerce",).fillna(0)
    orders["order_status"] = orders["order_status"].fillna("Unknown")
    delivery["issue_type"] = delivery["issue_type"].fillna("No issue reported")
    delivery["delivery_status"] = delivery["delivery_status"].fillna("Unknown")

    # Join the dataframes to get the big picture.
    merged = (
        orders.merge(
            customers[["customer_id", "customer_name", "region"]],
            on="customer_id",
            how="left",
            suffixes=("", "_customer"),
        )
        .merge(
            delivery[
                [
                    "order_id",
                    "promised_date",
                    "delivered_date",
                    "delivery_status",
                    "issue_type",
                ]
            ],
            on="order_id",
            how="left",
        )
    )
    merged["customer_name"] = merged["customer_name"].fillna("Unknown customer")
    merged["region"] = merged["region"].fillna("Unknown")

    merged["order_date"] = pd.to_datetime(merged["order_date"], errors='coerce')
    merged["order_month"] = merged["order_date"].dt.month

    # 3. Use NumPy to calculate delivery delays
    merged["delay_days"] = (merged["delivered_date"] - merged["promised_date"]).dt.days.fillna(0).clip(lower = 0)
    merged["is_delayed"] = np.where(
        (merged["delay_days"] > 0),
        1,
        0,
    )

    return merged

def create_reports(merged):
    # Create customer, regional and delivery issues summaries.
    top_customers = (
        merged.groupby(
            ["customer_id", "customer_name"],
            dropna=False,
        )
        .agg(
            order_count=("order_id", "count"),
            delayed_orders=("is_delayed", "sum"),
            total_delay_days=("delay_days", "sum"),
            order_total=("order_total", "sum"),
        )
        .reset_index()
        .sort_values(
            ["delayed_orders", "total_delay_days", "order_total"],
            ascending=False,
        )
    )

    regions_report = (
        merged.groupby("region", dropna=False)
        .agg(
            order_count=("order_id", "count"),
            delayed_orders=("is_delayed", "sum"),
            revenue=("order_total", "sum"),
        )
        .reset_index()
    )

    issues_report = (
        merged["issue_type"]
        .value_counts()
        .rename_axis("issue_type")
        .reset_index(name="issue_count")
    )

    delivery_status_report = (
        merged.groupby("delivery_status", dropna=False)
        .agg(
            order_count=("order_id", "count"),
            delayed_orders=("is_delayed", "sum"),
            total_delay_days=("delay_days", "sum"),
        )
        .reset_index()
        .sort_values(
            ["delayed_orders", "order_count"],
            ascending=False,
        )
    )

    return top_customers, regions_report, issues_report, delivery_status_report

def run(data_dir=DATA_DIR, output_dir=OUTPUT_DIR):
    # Run the customer order pipeline, save reports, and print results.
    print("=" * 60)
    print("CUSTOMER ORDER INSIGHTS AND DELIVERY TRACKER")
    print("=" * 60)

    print("\n[1] Loading customer order data")
    data = load_data(data_dir)
    print(f"Orders loaded: {len(data['orders'])} records")

    print("\n[2] Cleaning order and delivery data")
    cleaned = clean_data(data)
    print(f"Orders retained: {len(cleaned)} records")

    print("\n[3] Creating summary reports")
    top_customers, regions, issues, delivery_status_report = create_reports(cleaned)
    summary = {
        "input_orders": int(len(data["orders"])),
        "output_orders": int(len(cleaned)),
        "delayed_orders": int(cleaned["is_delayed"].sum()),
        "total_orders_value": round(float(cleaned["order_total"].sum()), 2),
    }
    with open(f"{output_dir}/run_summary.json", "w") as file:
        json.dump(summary, file, indent=2)

    # 4. Show top delayed customers and most common delivery issues
    print("\n" + "-" * 60)
    print("RUN SUMMARY")
    print("-" * 60)
    print(json.dumps(summary, indent=2))

    print("\n" + "-" * 60)
    print("TOP DELAYED CUSTOMERS")
    print("-" * 60)
    print(top_customers.head(10).to_string(index=False))

    print("\n" + "-" * 60)
    print("REGION SUMMARY")
    print("-" * 60)
    print(regions.to_string(index=False))

    print("\n" + "-" * 60)
    print("MOST COMMON DELIVERY ISSUES")
    print("-" * 60)
    print(issues.head(10).to_string(index=False))

    print("\n" + "-" * 60)
    print("DELIVERY STATUS REPORT")
    print("-" * 60)
    print(delivery_status_report.to_string(index=False))
    return summary


if __name__ == "__main__":
    run()
