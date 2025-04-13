import { rateService } from "../services/rate.services";

export const rateController = {
    addRate: async (req, res) => {
      try {
        const { userId, resId, amount } = req.body;
        const newRate = await rateService.addRate({ userId, resId, amount });
        res.status(201).json({ status: "success", data: newRate });
      } catch (err) {
        console.error("Lỗi khi đánh giá:", err);
        res.status(500).json({ status: "error", message: "Lỗi server" });
      }
    },
  
    getRatesByRestaurant: async (req, res) => {
      try {
        const { resId } = req.params;
        if (!resId) return res.status(400).json({ message: "Thiếu resId" });
        const data = await rateService.getRatesByRestaurant(resId);
        res.json({ status: "success", data });
      } catch (err) {
        res.status(500).json({ status: "error", message: "Lỗi server" });
      }
    },
  
    getRatesByUser: async (req, res) => {
      try {
        const { userId } = req.params;
        if (!userId) return res.status(400).json({ message: "Thiếu userId" });
        const data = await rateService.getRatesByUser(userId);
        res.json({ status: "success", data });
      } catch (err) {
        res.status(500).json({ status: "error", message: "Lỗi server" });
      }
    },
  };