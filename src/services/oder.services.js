import Order from "../models/Order";

export const addOrder = async (data) => {
    if (!data.dateOrder) {
      data.dateOrder = new Date(); // default: ngày hiện tại
    }
  
    const result = await Order.create(data);
    return result;
};