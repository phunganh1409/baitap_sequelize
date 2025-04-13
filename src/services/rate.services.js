import ReteRestaurant from "../models/ReteRestaurant";


export const rateService = {
    addRate: async ({ userId, resId, amount }) => {
      return await ReteRestaurant.create({ userId, resId, amount, dateRate: new Date() });
    },
  
    getRatesByRestaurant: async (resId) => {
      return await ReteRestaurant.findAll({ where: { resId } });
    },
                 
    getRatesByUser: async (userId) => {
      return await ReteRestaurant.findAll({ where: { userId } });
    },
  };