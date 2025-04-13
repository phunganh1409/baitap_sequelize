import express from 'express';
import sequelize, { models } from './src/common/sequelize/connect.sequelize';
import { DataTypes, Model } from 'sequelize';
import Food from './src/models/Food';
import initModels from './src/models/init-models';
import rootRouter from './src/routers/root.routers';

const app = express();


app.use(express.json())

app.use(`/api`, rootRouter)
 

// sequelize.authenticate()
//   .then(() => {
//     console.log("✅ Kết nối thành công đến MySQL");
//   })
//   .catch((err) => {
//     console.error("❌ Không thể kết nối DB:", err);
//   });

// // Sync models (chỉ dùng khi chưa có bảng trong DB hoặc lúc test)
// sequelize.sync({ alter: false }) // hoặc { force: false }
//   .then(() => {
//     console.log("🛠️ Models đã đồng bộ");
//   });

// app.get("/sequelize", async (req, res,next) => {
//   try {
//     const food = await models.Food.findAll({raw: true});
//     console.log("food", food);
//     res.json(food);
//   } catch (error) {
//     console.error("❌ Lỗi trong /sequelize:", error);
//     res.status(500).json({ error: "Lỗi server", detail: error.message });
//   }
// });

app.listen(3000, () => {
  console.log("🚀 Server is running on port 3000");
});
