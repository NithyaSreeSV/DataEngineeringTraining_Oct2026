/**
 * MongoDB Assessment 1 Submission (Part 8 - 11)
 * Databases: commerce_assessment
 * Collections: customers, orders, suppliers
 */

use commerce_assessment

// --- Part 8: Customers collection ---

// --- create customers collection ---

db.createCollection("customers");

// --- Seed the data ---

db.customers.insertMany([
    {
        customer_id: 501,
        customer_name: "Aditya Rao",
        email: "aditya@email.com",
        active: true,
        address: {
            city: "Hyderabad",
            state: "Telangana",
            pincode: "500081"
        },
        interests: ["Electronics", "Accessories"]
    },
    {
        customer_id: 502,
        customer_name: "Maya Thomas",
        email: "maya@email.com",
        active: true,
        address: {
            city: "Chennai",
            state: "Tamil Nadu",
            pincode: "600028"
        },
        interests: ["Furniture", "Home"]
    },
    {
        customer_id: 503,
        customer_name: "Faisal Ahmed",
        email: "faisal@email.com",
        active: false,
        address: {
            city: "Hyderabad",
            state: "Telangana",
            pincode: "500034"
        },
        interests: ["Electronics"]
    },
    {
        customer_id: 504,
        customer_name: "Nikita Shah",
        email: "nikita@email.com",
        active: true,
        address: {
            city: "Mumbai",
            state: "Maharashtra",
            pincode: "400050"
        },
        interests: ["Furniture", "Electronics"]
    }
]);

// 53. Display all customers.

db.customers.find({});

// 54. Find active customers.

db.customers.find({active: true});

// 55. Find customers from Hyderabad.

db.customers.find({"address.city": "Hyderabad" });

// 56. Find customers interested in Electronics.

db.customers.find({interests: "Electronics"});

// 57. Find customers interested in both: Furniture and Electronics

db.customers.find({interests: { $all: ["Furniture", "Electronics"]}});

// 58. Change customer 503 from inactive to active.

db.customers.updateOne({customer_id: 503}, {$set: {active: true}});

// 59. Change customer 504 's city.

db.customers.updateOne({customer_id: 504}, {$set: {"address.city": "Pune"}});

// 60. Add a new interest to customer 502.

db.customers.updateOne({customer_id: 502}, {$addToSet: {interests: "Accessories"}});

// --- Part 9: Array of Embedded Documents ---

// --- create orders collection ---

db.createCollection("orders");

// --- Seed the data ---

db.orders.insertMany([
    {
        order_id: 9001,
        customer_id: 501,
        order_date: ISODate("2026-09-01"),
        status: "Delivered",
        items: [
            {
                product: "Ultra Laptop",
                quantity: 1,
                price: 72000
            },
            {
                product: "Wireless Mouse",
                quantity: 2,
                price: 2000
            }
        ]
    },
    {
        order_id: 9002,
        customer_id: 502,
        order_date: ISODate("2026-09-03"),
        status: "Processing",
        items: [
            {
                product: "Office Desk",
                quantity: 1,
                price: 14500
            }
        ]
    },
    {
        order_id: 9003,
        customer_id: 503,
        order_date: ISODate("2026-09-05"),
        status: "Delivered",
        items: [
            {
                product: "Smart Monitor",
                quantity: 2,
                price: 26000
            },
            {
                product: "Mechanical Keyboard",
                quantity: 1,
                price: 5200
            }
        ]
    }
]);

// 61. Display orders having status Delivered.

db.orders.find({ status: "Delivered" });

// 62. Find orders containing Ultra Laptop.

db.orders.find({ "items.product": "Ultra Laptop" });

// 63. Find orders containing an item with quantity greater than 1.

db.orders.find({ "items.quantity": { $gt: 1 } });

// 64. Find orders containing: product = Smart Monitor AND quantity = 2 where both conditions belong to the same item.

db.orders.find({ items: { $elemMatch: { product: "Smart Monitor", quantity: 2 } } });

// 65. Add another item to order 9002.

db.orders.updateOne(
  { order_id: 9002 },
  { $push: { items: { product: "Gaming Chair", quantity: 1, price: 18500 } } }
);

// 66. Change order 9002 status to Delivered.

db.orders.updateOne({ order_id: 9002 }, { $set: { status: "Delivered" } });

// 67. Remove one item from an order.

db.orders.updateOne(
  { order_id: 9001 },
  { $pull: { items: { product: "Wireless Mouse" } } }
);

// --- Part 10: Document Design ---
/**
*68. Product can have five colors.
*	- Choice: Array
*	- Reason: Product colors are a small, fixed list of text values. An array makes it easy to store them together and filter customers by color.
*
*69. Customer has one residential address.
*	- Choice: Embedded Document
*	- Reason: A residential address belongs entirely to one customer. Embedding it ensures the address is always fetched automatically whenever we load the customer profile.
*
*70. Order contains multiple customers.
*	- Choice: Array of Embedded Documents
*	- Reason: An order needs to lock in the exact price and quantity at the time of purchase. Embedding these details directly inside the order historical record prevents future product changes from altering past order data.
*
*71. Product has RAM, storage and processor information.
*	- Choice: Embedded Document
*	- Reason: These specifications are highly related technical details. Grouping them into a single sub-object keeps the data organized and prevents messy indexing errors.
*
*72. Customer can have thousands of orders over many years.
*	- Choice: Seperate Collection/ Reference
*	- Reason: A loyal customer can place thousands of orders over time. Storing them inside the customer document will cause it to grow too large and eventually crash due to database size limits.
*	
*73. Product can have millions of customer reviews.
*	- Choice: Seperate Collection/ Reference
*	- Reason: Popular customers can get millions of reviews. Keeping reviews in a separate collection prevents the product document from hitting size limits and slowing down database performance.
*	
*74. Employee has first name and last name.
*	- Choice: Simple Field
*	- Reason: Names are basic strings that do not change structurally. Flat, separate fields are the simplest way to store them for quick sorting and searching.
*
*75. Product has multiple tags.
*	- Choice: Array
*	- Reason: Tags are simple keywords used for grouping customers. An array allows us to quickly find and filter items that match one or more specific tags.
 */
 
// --- Part 11: Final Challenge ---

// --- create suppliers collection ---

db.createCollection("suppliers");

// --- Seed the data ---

db.suppliers.insertMany([
  { supplier_id: 801, 
	supplier_name: "Apex Logistics", 
	city: "Bengaluru", 
	active: true, 
	categories: ["Electronics", "Accessories"], 
	contact: { email: "apex@email.com", phone: "9876543210" }, 
	warehouses: ["Whitefield", "Electronic City"], 
	registration_date: ISODate("2025-05-12") 
	},
  { supplier_id: 802, 
	supplier_name: "Bharat Furniture Hub", 
	city: "Mumbai", 
	active: true, 
	categories: ["Furniture", "Office Supplies"], 
	contact: { email: "bharat@email.com", phone: "9876543211" }, 
	warehouses: ["Thane", "Navi Mumbai"], 
	registration_date: ISODate("2026-02-20") },
  { supplier_id: 803, 
	supplier_name: "Indo Tech Components", 
	city: "Bengaluru", 
	active: false, 
	categories: ["Electronics"], 
	contact: { email: "indotech@email.com", phone: "9876543212" }, 
	warehouses: ["Peenya"], 
	registration_date: ISODate("2026-03-01") },
  { supplier_id: 804, 
	supplier_name: "Comfort Woods Ltd", 
	city: "Chennai", 
	active: true, 
	categories: ["Furniture"], 
	contact: { email: "comfort@email.com", phone: "9876543213" }, 
	warehouses: ["Guindy", "Ambattur"], 
	registration_date: ISODate("2025-11-15") },
  { supplier_id: 805, 
	supplier_name: "Global Smart Warehouse", 
	city: "Delhi", 
	active: true, 
	categories: ["Electronics", "Appliances"], 
	contact: { email: "global@email.com", phone: "9876543214" }, 
	warehouses: ["Okhla", "Gurugram"], 
	registration_date: ISODate("2026-04-10") }
]);

// 76. Display all active suppliers.

db.suppliers.find({ active: true });

// 77. Find suppliers from a city of your choice.

db.suppliers.find({ city: "Bengaluru" });

// 78. Find suppliers handling Electronics.

db.suppliers.find({ categories: "Electronics" });

// 79. Find suppliers registered after 1 January 2026.

db.suppliers.find({ registration_date:{ $gt: ISODate("2026-01-01")} });

// 80. Add another warehouse to one supplier.

db.suppliers.updateOne({ supplier_id: 804 }, { $addToSet: { warehouses: "Velachery" } });

// 81. Change the active status of one supplier.

db.suppliers.updateOne({ supplier_id: 803 }, { $set: { active: true } });

// 82. Remove one category from one supplier.

db.suppliers.updateOne({ supplier_id: 805 }, { $pull: { categories: "Appliances" } });

// 83. Display supplier name and city only.

db.suppliers.find({}, { supplier_name: 1, city: 1, _id: 0 });

// 84. Sort suppliers by registration date.

db.suppliers.find().sort({ registration_date: 1 });

// 85. Explain briefly why you used: an array for categories, an embedded document for contact details, an array for warehouse locations.

/**
*	- Categories are simple text labels used to classify items. An array tracks multiple categories easily without creating unnecessary relationships or deep structures.
*	- Contact details like phone and email strictly belongs to a single profile. Grouping them inside the parent document ensures they are always retrieved instantly alongside the user's identity.
*	- customers or items may be distributed across multiple physical buildings(warehouses). Using an array allows the database to easily add or remove specific warehouse locations as inventory updates.
*/