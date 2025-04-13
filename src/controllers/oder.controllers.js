import { addOrder } from "../services/oder.services";

export const orderController = async (req, res) => {
    try {
      const data = req.body;
      const result = await addOrder(data);
      res.status(201).send(result);
    } catch (error) {
      res.status(500).send({ message: "Lỗi khi thêm order", error });
    }
  };