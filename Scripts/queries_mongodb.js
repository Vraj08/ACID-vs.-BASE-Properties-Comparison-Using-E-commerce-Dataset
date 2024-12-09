
// Order Processing Analysis
db.order_items_products.aggregate([
    {
        $group: {
            _id: "$product_category_name",
            totalOrders: { $sum: 1 }
        }
    },
    { $sort: { totalOrders: -1 } }
]);

// Payment Success Rates
db.orders_customers.aggregate([
    {
        $group: {
            _id: null,
            totalOrders: { $sum: 1 },
            deliveredOrders: { $sum: { $cond: [{ $eq: ["$order_status", "delivered"] }, 1, 0] } }
        }
    },
    {
        $project: {
            _id: 0,
            paymentSuccessRate: {
                $multiply: [
                    { $divide: ["$deliveredOrders", "$totalOrders"] },
                    100
                ]
            }
        }
    }
]);

// Review Sentiment Analysis
db.reviews_orders.aggregate([
    {
        $project: {
            review_id: 1,
            order_id: 1,
            review_score: 1,
            sentiment: {
                $cond: [
                    { $eq: ["$review_score", 3] }, 
                    "Neutral", 
                    { $cond: [{ $gt: ["$review_score", 3] }, "Positive", "Negative"] }
                ]
            }
        }
    }
]);

// Profitability Metrics
db.order_items_products.updateMany(
    {},
    {
        $set: {
            estimated_profit_margin: {
                $subtract: ["$price", { $add: ["$freight_value", "$product_weight_g"] }]
            }
        }
    }
);

db.order_items_products.aggregate([
    {
        $group: {
            _id: "$category_name",
            totalSales: { $sum: "$price" },
            totalItemsSold: { $sum: 1 }
        }
    },
    { $sort: { totalSales: -1 } }
]);
