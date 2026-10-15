# Pandas Processing
import pandas as pd
import numpy as np
# 36. Read shipments.csv.
shipments = pd.read_csv("shipments.csv")

# 37. Filter Delivered shipments.
print("Delivered shipments:\n", shipments.query("status == 'Delivered'"))

# 38. Count records by status.
print("Count by status:\n", shipments["status"].value_counts())

# 39. Convert shipment date to datetime.
shipments["shipment_date"] = pd.to_datetime(shipments["shipment_date"])

# 40. Count shipments by month and status.
shipments["month"] = shipments["shipment_date"].dt.month
print("Count by month and status:\n", shipments.groupby(["month", "status"]).size())

# 41. Calculate average cost by destination.
print("Average cost by destination:\n", shipments.groupby("destination")["cost"].mean())

# 42. Calculate total weight by destination.
print("Total weight by destination:\n", shipments.groupby("destination")["weight"].sum())

# 43. Read only selected columns using a dynamic usecols list.
selected_columns = ["shipment_id", "destination", "status", "cost"]
print("Selected columns:\n", pd.read_csv("shipments.csv", usecols=selected_columns).head())

# 44. Read hubs.csv.
hubs = pd.read_csv("hubs.csv")

# 45. Inner join shipments and hubs using hub_id.
joined = shipments.merge(hubs, on="hub_id", how="inner")

# 46. Find total shipment cost handled by each hub.
# 47. Find total number of shipments handled by each hub.
# 48. Sort hubs by total shipment cost.
hub_summary = (joined.groupby(["hub_id", "hub_name", "city", "manager"])
               .agg(total_cost=("cost", "sum"), total_shipments=("shipment_id", "count")).
               reset_index().sort_values("total_cost", ascending=False))
print("Hub summary:\n", hub_summary)

# 49. Save results to CSV.
hub_summary.to_csv("hub_summary.csv", index=False)

# 50. Save results to JSON.
hub_summary.to_json("hub_summary.json", orient="records", indent=4)

# Pandas/NumPy Enrichment

# 51. Add: cost_per_kg = cost / weight.
joined["cost_per_kg"] = joined["cost"] / joined["weight"]

# 52. Use NumPy to classify: cost >= 1200 → Expensive, otherwise → Normal.
joined["cost_category"] = np.where(joined["cost"] >= 1200, "Expensive", "Normal")

# 53. Add a shipment performance category based on both status and cost.
def performance_category(row):
    if row["status"] == "Delivered" and row["cost"] >= 1000:
        return "High Cost Delivered"
    if row["status"] == "Delivered":
        return "Delivered"
    if row["status"] == "In Transit":
        return "In Transit"
    return "Pending Review"
joined["shipment_performance"] = joined.apply(performance_category, axis=1)

# 54. Save the final enriched dataset as: shipment_analysis.csv.
joined.to_csv("shipment_analysis.csv", index=False)