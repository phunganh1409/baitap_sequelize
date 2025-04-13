import LikeRate from "../models/LikeRate";

export const likeService = {
    likeRestaurant: async (userId, resId) => {
      return await LikeRate.create({ userId, resId, dateLike: new Date() });
    },
  
    unlikeRestaurant: async (userId, resId) => {
      return await LikeRate.destroy({ where: { userId, resId,  } });
    },
  
    getLikesByRestaurant: async (resId) => {
      return await LikeRate.findAll({ where: { resId} });
    },
  
    getLikesByUser: async (userId) => {
      return await LikeRate.findAll({ where: { userId} });
    },
  };