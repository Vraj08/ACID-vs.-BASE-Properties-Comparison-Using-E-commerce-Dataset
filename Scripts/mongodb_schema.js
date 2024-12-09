// MongoDB Denormalization and Query Examples

// Denormalization: Embed product details into order items
db.order_items_products.updateMany(
    {},
    [
        {
            $lookup: {
                from: "products_categories",
                localField: "product_id",
                foreignField: "product_id",
                as: "product_details"
            }
        },
        { $unwind: "$product_details" },
        {
            $set: {
                category_name: "$product_details.product_category_name",
                product_weight_g: "$product_details.product_weight_g"
            }
        },
        { $unset: "product_details" }
    ]
);

// Create Index for faster querying
db.order_items_products.createIndex({ product_id: 1 });
db.orders_customers.createIndex({ customer_id: 1 });
db.reviews_orders.createIndex({ order_id: 1 });

// Example Aggregation: Calculate total sales per product category
db.order_items_products.aggregate([
    { $group: { _id: "$category_name", total_sales: { $sum: "$price" } } },
    { $sort: { total_sales: -1 } }
]);

// Example: Calculate sentiment classification
db.reviews_orders.aggregate([
    {
        $project: {
            sentiment: {
                $cond: [
                    { $gt: ["$review_score", 3] }, "Positive",
                    { $eq: ["$review_score", 3] }, "Neutral",
                    "Negative"
                ]
            }
        }
    }
]);
