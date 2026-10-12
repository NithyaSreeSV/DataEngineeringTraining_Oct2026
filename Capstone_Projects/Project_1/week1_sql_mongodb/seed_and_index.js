/**
 * MongoDB Project 1 Submission
 * Database: supply_chain_lab
 * Collection: shipment_events
 */
 
// --- Prepare the data ---

use supply_chain_lab

// --- create shipment_events collection ---

db.createCollection("shipment_events", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["event_id", "shipment_id", "event_type", "event_time"],
      properties: {
        event_id: { bsonType: "int" },
        shipment_id: { bsonType: "int" },
        event_type: { bsonType: "string" },
        event_time: { bsonType: "date" },
        location: { bsonType: "string" },
        note: { bsonType: "string" },
      },
    },
  },
});

// --- seed the data ---

db.shipment_events.insertOne({
  event_id: 1,
  shipment_id: 3003,
  event_type: "IN_TRANSIT",
  event_time: new Date("2026-09-01 07:00:00Z"),
  location: "Bengaluru",
  note: "Movement update",
});

db.shipment_events.insertOne({
  event_id: 2,
  shipment_id: 3005,
  event_type: "CUSTOMS",
  event_time: new Date("2026-09-01 14:00:00Z"),
  location: "Mumbai",
  note: "Inspection completed",
});

db.shipment_events.insertOne({
  event_id: 3,
  shipment_id: 3007,
  event_type: "OUT_FOR_DELIVERY",
  event_time: new Date("2026-09-01 21:00:00Z"),
  location: "Coimbatore",
  note: "Vehicle departed",
});

db.shipment_events.insertMany([
  { event_id: 4, shipment_id: 3009, event_type: "RECEIVED", event_time: new Date("2026-09-02 04:00:00Z"), location: "Chennai", note: "Shipment checked in" },
  { event_id: 5, shipment_id: 3011, event_type: "PICKED_UP", event_time: new Date("2026-09-02 11:00:00Z"), location: "Bengaluru", note: "Scan received" },
  { event_id: 6, shipment_id: 3013, event_type: "IN_TRANSIT", event_time: new Date("2026-09-02 18:00:00Z"), location: "Mumbai", note: "Movement update" },
  { event_id: 7, shipment_id: 3015, event_type: "CUSTOMS", event_time: new Date("2026-09-03 01:00:00Z"), location: "Coimbatore", note: "Inspection completed" },
  { event_id: 8, shipment_id: 3017, event_type: "OUT_FOR_DELIVERY", event_time: new Date("2026-09-03 08:00:00Z"), location: "Chennai", note: "Vehicle departed" },
  { event_id: 9, shipment_id: 3019, event_type: "RECEIVED", event_time: new Date("2026-09-03 15:00:00Z"), location: "Bengaluru", note: "Shipment checked in" },
  { event_id: 10, shipment_id: 3021, event_type: "PICKED_UP", event_time: new Date("2026-09-03 22:00:00Z"), location: "Mumbai", note: "Scan received" },
  { event_id: 11, shipment_id: 3023, event_type: "IN_TRANSIT", event_time: new Date("2026-09-04 05:00:00Z"), location: "Coimbatore", note: "Movement update" },
  { event_id: 12, shipment_id: 3025, event_type: "CUSTOMS", event_time: new Date("2026-09-04 12:00:00Z"), location: "Chennai", note: "Inspection completed" },
  { event_id: 13, shipment_id: 3027, event_type: "OUT_FOR_DELIVERY", event_time: new Date("2026-09-04 19:00:00Z"), location: "Bengaluru", note: "Vehicle departed" },
  { event_id: 14, shipment_id: 3029, event_type: "RECEIVED", event_time: new Date("2026-09-05 02:00:00Z"), location: "Mumbai", note: "Shipment checked in" },
  { event_id: 15, shipment_id: 3031, event_type: "PICKED_UP", event_time: new Date("2026-09-05 09:00:00Z"), location: "Coimbatore", note: "Scan received" },
  { event_id: 16, shipment_id: 3033, event_type: "IN_TRANSIT", event_time: new Date("2026-09-05 16:00:00Z"), location: "Chennai", note: "Movement update" },
  { event_id: 17, shipment_id: 3035, event_type: "CUSTOMS", event_time: new Date("2026-09-05 23:00:00Z"), location: "Bengaluru", note: "Inspection completed" },
  { event_id: 18, shipment_id: 3037, event_type: "OUT_FOR_DELIVERY", event_time: new Date("2026-09-06 06:00:00Z"), location: "Mumbai", note: "Vehicle departed" },
  { event_id: 19, shipment_id: 3039, event_type: "RECEIVED", event_time: new Date("2026-09-06 13:00:00Z"), location: "Coimbatore", note: "Shipment checked in" },
  { event_id: 20, shipment_id: 3041, event_type: "PICKED_UP", event_time: new Date("2026-09-06 20:00:00Z"), location: "Chennai", note: "Scan received" },
  { event_id: 21, shipment_id: 3043, event_type: "IN_TRANSIT", event_time: new Date("2026-09-07 03:00:00Z"), location: "Bengaluru", note: "Movement update" },
  { event_id: 22, shipment_id: 3045, event_type: "CUSTOMS", event_time: new Date("2026-09-07 10:00:00Z"), location: "Mumbai", note: "Inspection completed" },
  { event_id: 23, shipment_id: 3047, event_type: "OUT_FOR_DELIVERY", event_time: new Date("2026-09-07 17:00:00Z"), location: "Coimbatore", note: "Vehicle departed" },
  { event_id: 24, shipment_id: 3049, event_type: "RECEIVED", event_time: new Date("2026-09-08 00:00:00Z"), location: "Chennai", note: "Shipment checked in" },
  { event_id: 25, shipment_id: 3051, event_type: "PICKED_UP", event_time: new Date("2026-09-08 07:00:00Z"), location: "Bengaluru", note: "Scan received" },
  { event_id: 26, shipment_id: 3053, event_type: "IN_TRANSIT", event_time: new Date("2026-09-08 14:00:00Z"), location: "Mumbai", note: "Movement update" },
  { event_id: 27, shipment_id: 3055, event_type: "CUSTOMS", event_time: new Date("2026-09-08 21:00:00Z"), location: "Coimbatore", note: "Inspection completed" },
  { event_id: 28, shipment_id: 3057, event_type: "OUT_FOR_DELIVERY", event_time: new Date("2026-09-09 04:00:00Z"), location: "Chennai", note: "Vehicle departed" },
  { event_id: 29, shipment_id: 3059, event_type: "RECEIVED", event_time: new Date("2026-09-09 11:00:00Z"), location: "Bengaluru", note: "Shipment checked in" },
  { event_id: 30, shipment_id: 3001, event_type: "PICKED_UP", event_time: new Date("2026-09-09 18:00:00Z"), location: "Mumbai", note: "Scan received" }
]);

// --- check the seeded data ---

db.shipment_events.find({});

// --- create index for shipment_id and event_time ---

db.shipment_events.createIndex({shipment_id: 1, event_time: -1 });

// --- create index for event_type

db.shipment_events.createIndex({ event_type: 1 });