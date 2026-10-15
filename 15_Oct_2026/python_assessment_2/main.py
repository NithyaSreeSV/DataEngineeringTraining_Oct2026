# 34. Import them into main.py.
# 35. Use both normal import and specific-function import.
import shipment_utils
from shipment_utils import shipment_category
import shipment_utils as su

print(shipment_utils.shipping_cost(12.5, 850))
print(shipment_category(22))
print(su.shipment_category(8))