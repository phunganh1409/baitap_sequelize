import { likeService } from "../services/like.services";

export const likeController = {
  // Người dùng like nhà hàng
  like: async (req, res) => {
    try {
      const { userId, resId } = req.body;
      if (!userId || !resId) {
        return res.status(400).json({ message: "Thiếu userId hoặc resId" });
      }

      console.log("Yêu cầu like:", req.body);
      const data = await likeService.likeRestaurant(userId, resId);

      return res.json({ status: "success", message: "Đã like", data });
    } catch (error) {
      console.error("Lỗi khi like:", error);
      return res.status(500).json({ status: "error", message: "Lỗi server" });
    }
  },

  // Người dùng bỏ like nhà hàng
  unlike: async (req, res) => {
    try {
      const { userId, resId } = req.body;
      if (!userId || !resId) {
        return res.status(400).json({ message: "Thiếu userId hoặc resId" });
      }

      await likeService.unlikeRestaurant(userId, resId);
      return res.json({ status: "success", message: "Đã bỏ like" });
    } catch (error) {
      console.error("Lỗi khi bỏ like:", error);
      return res.status(500).json({ status: "error", message: "Lỗi server" });
    }
  },

  // Lấy danh sách like theo nhà hàng
  getByRestaurant: async (req, res) => {
    try {
      const { resId } = req.params;
      if (!resId) {
        return res.status(400).json({ message: "Thiếu resId" });
      }

      const data = await likeService.getLikesByRestaurant(resId);
      return res.json({ status: "success", data });
    } catch (error) {
      console.error("Lỗi khi lấy like theo nhà hàng:", error);
      return res.status(500).json({ status: "error", message: "Lỗi server" });
    }
  },

  // Lấy danh sách like theo người dùng
  getByUser: async (req, res) => {
    try {
      const { userId } = req.params;
      if (!userId) {
        return res.status(400).json({ message: "Thiếu userId" });
      }

      const data = await likeService.getLikesByUser(userId);
      return res.json({ status: "success", data });
    } catch (error) {
      console.error("Lỗi khi lấy like theo người dùng:", error);
      return res.status(500).json({ status: "error", message: "Lỗi server" });
    }
  },
};
