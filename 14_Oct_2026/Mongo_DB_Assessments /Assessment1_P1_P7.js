/**
 * MongoDB Assessment 1 Submission (Part 1 - 7)
 * Databases: commerce_assessment
 * Collections: products
 */

use commerce_assessment

// --- create products collection ---

db.createCollection("products");

// --- Seed the data ---

db.products.insertMany([
	{ product_id: 101, product_name: "Ultra Laptop", category: "Electronics", brand: "TechPro", price: 72000, stock: 12, available: true,
	launch_date: ISODate("2026-01-15"), colors: ["Black", "Silver"], specifications: { ram: "16 GB", storage: "1 TB SSD", warranty_years: 2}
	},
	{ product_id: 102, product_name: "Wireless Mouse", category: "Accessories", brand: "ClickMax", price: 1800, stock: 40, available: true,
	launch_date: ISODate("2026-02-10"), colors: ["Black", "Blue", "Red"], specifications: { wireless: true, warranty_years: 1}
	},
	{ product_id: 103, product_name: "Office Desk", category: "Furniture", brand: "WorkSpace", price: 14500, stock: 8, available: true,
	launch_date: ISODate("2025-11-20"), colors: ["Brown", "Black"], specifications: { material: "Wood", adjustable: false, warranty_years: 3}
	},
	{ product_id: 104, product_name: "Smart Monitor", category: "Electronics", brand: "VisionPlus", price: 26000, stock: 5, available: true,
	launch_date: ISODate("2026-03-01"), colors: ["Black"], specifications: { screen_size: "27 inch", resolution: "4K", warranty_years: 2}
	},
	{ product_id: 105, product_name: "Gaming Chair", category: "Furniture", brand: "SeatPro", price: 18500, stock: 0, available: false,
	launch_date: ISODate("2026-01-05"), colors: ["Black", "Red"], specifications: { material: "Leather", adjustable: true, warranty_years: 3}
	},
	{ product_id: 106, product_name: "Mechanical Keyboard", category: "Accessories", brand: "KeyWorks", price: 5200, stock: 18, available: true,
	launch_date: ISODate("2026-04-12"), colors: ["Black", "White"], specifications: { backlit: true, wireless: false, warranty_years: 1}
	}
]);

// --- Part 2: CRUD Operations ---

// 1. Display all products.

db.products.find({});

// 2. Display only one product having product_id = 103.

db.products.find({product_id: 103});

// 3. Insert a new product with: Product ID: 107, Product Name: Bluetooth Speaker,
// Category: Electronics,Brand: SoundMax,Price: 7500,Stock: 20,Available: true

db.products.insertOne({
	product_id: 107,
	product_name: "Bluetooth Speaker",
	category: "Electronics",
	brand: "SoundMax",
	price: 7500,
	stock: 20,
	available: true,
	launch_date: ISODate("2026-04-12"),
	colors: ["Black", "White"],
	specifications: {
	backlit: true,
	wireless: false,
	warranty_years: 1
	}
});
// 4. Insert two additional products in a single operation.

db.products.insertMany([{
		product_id: 108,
		product_name: "Noise-Canceling Headphones",
		category: "Electronics",
		brand: "SoundMax",
		price: 2500,
		stock: 25,
		available: true,
		launch_date: ISODate("2026-05-18"),
		colors: ["Black", "Silver", "White"],
		specifications: {
			battery_life: "30 hours",
			wireless: true,
			warranty_years: 1
		}
	},{
		product_id: 109,
		product_name: "Ergonomic Footrest",
		category: "Furniture",
		brand: "WorkSpace",
		price: 3200,
		stock: 15,
		available: true,
		launch_date: ISODate("2026-06-02"),
		colors: ["Grey", "Black"],
		specifications: {
		  material: "Memory Foam",
		  adjustable: true,
		  warranty_years: 2
		}
	}
]);

// 5. Update the price of product 102 to 2000.

db.products.updateOne({ product_id: 102 }, { $set: { price: 2000 } });

// 6. Update both stock and availability of product 105.

db.products.updateOne({ product_id: 105 }, { $set: { stock: 20, available: true } });

// 7. Increase the stock of product 104 by 10.

db.products.updateOne({ product_id: 104 }, { $inc: { stock: 10 } });

// 8. Reduce the stock of product 106 by 3.

db.products.updateOne({ product_id: 106}, { $inc: { stock: -3 } });

// 9. Add a new field called: discount_percent with value 10 to product 101.

db.products.updateOne({ product_id: 101}, { $set: { discount_percent: 10 } });

// 10. Remove discount_percent from product 101.

db.products.updateOne({ product_id: 101}, { $unset: { discount_percent: "" } });

// 11. Delete one product using its product_id and 13. Verify the documents before and after each delete.

db.products.find({ product_id: 107 });

db.products.deleteOne({ product_id: 107 });

db.products.find({ product_id: 107 });

// 12. Delete all products where: stock = 0 and 13. Verify the documents before and after each delete.

db.products.find({ stock: 0 });

db.products.deleteMany({ stock: 0 });

db.products.find({ stock: 0 });

// --- Part 3: Filtering and Query Operators ---

// 14. Find all Electronics products.

db.products.find({ category: "Electronics" });

// 15. Find products costing more than ₹10,000.

db.products.find({ price: { $gt: 10000 } });

// 16. Find products costing between ₹5,000 and ₹30,000.

db.products.find({ price: { $gte: 5000, $lte: 30000 } });

// 17. Find products whose stock is less than 10.

db.products.find({ stock: { $lt: 10 } });

// 18. Find products that are currently available.

db.products.find({ available: true });

// 19. Find products that are not available.

db.products.find({ available: false });

// 20. Find products belonging to either: Electronics or Furniture.

db.products.find({ category: { $in: ["Electronics", "Furniture"] } });

// 21. Find products that are not in the Accessories category.

db.products.find({ category: { $ne: "Accessories" } });

// 22. Find products where: price > 10000 AND stock > 5

db.products.find({
  $and: [
    { price: { $gt: 10000 } },
    { stock: { $gt: 5 } }
  ]
});

// 23. Find products where: category = Electronics OR price < 5000

db.products.find({
  $or: [
    { category: "Electronics" },
    { price: { $lt: 5000 } }
  ]
});

// 24. Find products launched after: 1 February 2026

db.products.find({ launch_date: { $gt: ISODate("2026-02-01") } });

// 25. Find products launched between: 1 January 2026 and 31 March 2026

db.products.find({ launch_date: { $gte: ISODate("2026-01-01"), $lte: ISODate("2026-03-31") } });

// --- Part 4: Projection and Sorting ---

// 26. Display only: product_name and price. Do not display _id.

db.products.find({}, { product_name: 1, price: 1, _id: 0 });

// 27. Display: product_name, category, stock.

db.products.find({}, { product_name: 1, category: 1, stock: 1 });

// 28. Sort products by price from lowest to highest.

db.products.find().sort({ price: 1 });

// 29. Sort products by price from highest to lowest.

db.products.find().sort({ price: -1 });

// 30. Sort products alphabetically by product name.

db.products.find().sort({ product_name: 1 });

// 31. Display the three most expensive products.

db.products.find().sort({ price: -1 }).limit(3);

// 32. Display the two products having the lowest stock.

db.products.find().sort({ stock: 1 }).limit(2);

// --- Part 5: Arrays ---

// 33. Find products available in Black.

db.products.find({ colors: "Black" });

// 34. Find products available in both: Black and Silver.

db.products.find({ colors: { $all: ["Black", "Silver"] } });

// 35. Find products available in either: White or Blue.

db.products.find({ colors: { $in: ["White", "Blue"] } });

// 36. Add Grey to product 101.

db.products.updateOne(
  { product_id: 101 },
  { $push: { colors: "Grey" } }
);

// 37. Add Black to product 101 without creating a duplicate if it already exists.

db.products.updateOne(
  { product_id: 101 },
  { $addToSet: { colors: "Black" } }
);

// 38. Remove Red from product 102.

db.products.updateOne(
  { product_id: 102 },
  { $pull: { colors: "Red" } }
);

// 39. Display products having more than one color.

// way 1 - When colors array can be missing in some records
db.products.find({ $expr: { $gt: [{ $size: { $ifNull: ["$colors", []] } }, 1] } });

// way 2 - when colors array is always present in all records
db.products.find({ "colors.1": { $exists: true } });

// --- Part 6: Embedded Documents ---

// 40. Find products whose warranty is 2 years.

db.products.find({ "specifications.warranty_years": 2 });

// 41. Find products where: specifications.adjustable = true.

db.products.find({ "specifications.adjustable": true });

// 42. Find products with: specifications.wireless = true.

db.products.find({ "specifications.wireless": true });

// 43. Change the warranty of product 103 from 3 to 5 years.

db.products.updateOne(
  { product_id: 103 },
  { $set: { "specifications.warranty_years": 5 } }
);

// 44. Add: specifications.country_of_origin to any two products.

db.products.updateMany(
  { product_id: { $in: [101, 104] } },
  { $set: { "specifications.country_of_origin": "India" } }
);

// 45. Find products manufactured in the country you added.

db.products.find({ "specifications.country_of_origin": "India" });


// --- Part 7: Data Types --- 

// 46. Find documents where price is stored as a numeric type.

db.products.find({ price: { $type: "number" } });

// 47. Find the datatype of: launch_date

db.products.aggregate([
  { $limit: 1 },
  { $project: { launch_date_type: { $type: "$launch_date" }, _id: 0 } }
]);

// 48. Find the datatype of: colors

db.products.aggregate([
  { $limit: 1 },
  { $project: { colors_type: { $type: "$colors" }, _id: 0 } }
]);

// 49. Find the datatype of: specifications

db.products.aggregate([
  { $limit: 1 },
  { $project: { specifications_type: { $type: "$specifications" }, _id: 0 } }
]);

// 50. Insert one intentionally incorrect product where: price is stored as a string instead of a number.

db.products.insertOne({
  product_id: 110,
  product_name: "Premium Earbuds",
  category: "Accessories",
  brand: "AudioX",
  price: "4500", 
  stock: 15,
  available: true,
  launch_date: ISODate("2026-05-20")
});

// 51. Write a query that identifies products where price is stored as a string.

db.products.find({ price: { $type: "string" } });

// 52. Correct that product so price becomes numeric.

// This converts the string variant to an integer for any records matching the criteria
db.products.find({ price: { $type: "string" } }).forEach(function(doc) {
  db.products.updateOne(
    { _id: doc._id },
    { $set: { price: NumberInt(doc.price) } }
  );
});