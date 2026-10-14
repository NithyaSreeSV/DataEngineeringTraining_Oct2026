/**
 * MongoDB Project 2 Submission
 * Database: customer_order_lab
 * Collection: customer_feedback
 */
 
// --- Prepare the data ---

use customer_order_lab;

// --- create customer_feedback collection ---

db.createCollection("customer_feedback", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: [
        "feedback_id",
        "customer_id",
        "rating",
        "comment",
        "created_at",
      ],
      properties: {
        feedback_id: { bsonType: "int" },
        customer_id: { bsonType: "int" },
        order_id: { bsonType: "int" },
        rating: { bsonType: "int", minimum: 1, maximum: 5 },
        comment: { bsonType: "string" },
        created_at: { bsonType: "date" },
        tags: { bsonType: "array", items: { bsonType: "string" } },
      },
    },
  },
});

// --- seed the data ---

db.customer_feedback.insertOne({
  feedback_id: 1,
  customer_id: 104,
  order_id: 1003,
  rating: 2,
  comment: "Good delivery experience",
  created_at: new Date("2026-09-02T00:00:00Z"),
  tags: ["delivery", "training"],
});

db.customer_feedback.insertOne({
  feedback_id: 2,
  customer_id: 107,
  order_id: 1005,
  rating: 3,
  comment: "Product was damaged",
  created_at: new Date("2026-09-03T00:00:00Z"),
  tags: ["delivery", "training"],
});

db.customer_feedback.insertOne({
  feedback_id: 3,
  customer_id: 110,
  order_id: 1007,
  rating: 4,
  comment: "Helpful support",
  created_at: new Date("2026-09-04T00:00:00Z"),
  tags: ["delivery", "training"],
});

db.customer_feedback.insertMany([
  { "feedback_id": 4, "customer_id": 101, "order_id": 1009, "rating": 5, "comment": "Tracking updates missing", "created_at": new Date("2026-09-05T00:00:00Z"), "tags": ["delivery", "training"] },
  { "feedback_id": 5, "customer_id": 104, "order_id": 1011, "rating": 1, "comment": "Package arrived late", "created_at": new Date("2026-09-06T00:00:00Z"), "tags": ["delivery", "training"] },
  { "feedback_id": 6, "customer_id": 107, "order_id": 1013, "rating": 2, "comment": "Good delivery experience", "created_at": new Date("2026-09-07T00:00:00Z"), "tags": ["delivery", "training"] },
  { "feedback_id": 7, "customer_id": 110, "order_id": 1015, "rating": 3, "comment": "Product was damaged", "created_at": new Date("2026-09-08T00:00:00Z"), "tags": ["delivery", "training"] },
  { "feedback_id": 8, "customer_id": 101, "order_id": 1017, "rating": 4, "comment": "Helpful support", "created_at": new 
  Date("2026-09-09T00:00:00Z"), "tags": ["delivery", "training"] },
  { "feedback_id": 9, "customer_id": 104, "order_id": 1019, "rating": 5, "comment": "Tracking updates missing", "created_at": new Date("2026-09-10T00:00:00Z"), "tags": ["delivery", "training"] },
  { "feedback_id": 10, "customer_id": 107, "order_id": 1021, "rating": 1, "comment": "Package arrived late", "created_at": new Date("2026-09-11T00:00:00Z"), "tags": ["delivery", "training"] },
  { "feedback_id": 11, "customer_id": 110, "order_id": 1023, "rating": 2, "comment": "Good delivery experience", "created_at": new Date("2026-09-12T00:00:00Z"), "tags": ["delivery", "training"] },
  { "feedback_id": 12, "customer_id": 101, "order_id": 1025, "rating": 3, "comment": "Product was damaged", "created_at": new Date("2026-09-13T00:00:00Z"), "tags": ["delivery", "training"] },
  { "feedback_id": 13, "customer_id": 104, "order_id": 1027, "rating": 4, "comment": "Helpful support", "created_at": new Date("2026-09-14T00:00:00Z"), "tags": ["delivery", "training"] },
  { "feedback_id": 14, "customer_id": 107, "order_id": 1029, "rating": 5, "comment": "Tracking updates missing", "created_at": new Date("2026-09-15T00:00:00Z"), "tags": ["delivery", "training"] },
  { "feedback_id": 15, "customer_id": 110, "order_id": 1031, "rating": 1, "comment": "Package arrived late", "created_at": new Date("2026-09-16T00:00:00Z"), "tags": ["delivery", "training"] },
  { "feedback_id": 16, "customer_id": 101, "order_id": 1033, "rating": 2, "comment": "Good delivery experience", "created_at": new Date("2026-09-17T00:00:00Z"), "tags": ["delivery", "training"] },
  { "feedback_id": 17, "customer_id": 104, "order_id": 1035, "rating": 3, "comment": "Product was damaged", "created_at": new Date("2026-09-18T00:00:00Z"), "tags": ["delivery", "training"] },
  { "feedback_id": 18, "customer_id": 107, "order_id": 1037, "rating": 4, "comment": "Helpful support", "created_at": new Date("2026-09-19T00:00:00Z"), "tags": ["delivery", "training"] },
  { "feedback_id": 19, "customer_id": 110, "order_id": 1039, "rating": 5, "comment": "Tracking updates missing", "created_at": new Date("2026-09-20T00:00:00Z"), "tags": ["delivery", "training"] },
  { "feedback_id": 20, "customer_id": 101, "order_id": 1041, "rating": 1, "comment": "Package arrived late", "created_at": new Date("2026-09-21T00:00:00Z"), "tags": ["delivery", "training"] },
  { "feedback_id": 21, "customer_id": 104, "order_id": 1043, "rating": 2, "comment": "Good delivery experience", "created_at": new Date("2026-09-22T00:00:00Z"), "tags": ["delivery", "training"] },
  { "feedback_id": 22, "customer_id": 107, "order_id": 1045, "rating": 3, "comment": "Product was damaged", "created_at": new Date("2026-09-23T00:00:00Z"), "tags": ["delivery", "training"] },
  { "feedback_id": 23, "customer_id": 110, "order_id": 1047, "rating": 4, "comment": "Helpful support", "created_at": new Date("2026-09-24T00:00:00Z"), "tags": ["delivery", "training"] },
  { "feedback_id": 24, "customer_id": 101, "order_id": 1049, "rating": 5, "comment": "Tracking updates missing", "created_at": new Date("2026-09-25T00:00:00Z"), "tags": ["delivery", "training"] },
  { "feedback_id": 25, "customer_id": 104, "order_id": 1051, "rating": 1, "comment": "Package arrived late", "created_at": new Date("2026-09-26T00:00:00Z"), "tags": ["delivery", "training"] }
]);

// --- check the seeded data ---

db.customer_feedback.find({});

// --- create index for customer_id ---

db.customer_feedback.createIndex({rating:1,created_at:-1});