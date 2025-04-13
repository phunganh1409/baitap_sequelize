import _sequelize from "sequelize";
const DataTypes = _sequelize.DataTypes;
import _Food from  "./Food.js";
import _LikeRate from  "./LikeRate.js";
import _Order from  "./Order.js";
import _Restaurant from  "./Restaurant.js";
import _ReteRestaurant from  "./ReteRestaurant.js";
import _Roles from  "./Roles.js";
import _SubFood from  "./SubFood.js";
import _TypeFood from  "./TypeFood.js";
import _User from  "./User.js";

export default function initModels(sequelize) {
  const Food = _Food.init(sequelize, DataTypes);
  const LikeRate = _LikeRate.init(sequelize, DataTypes);
  const Order = _Order.init(sequelize, DataTypes);
  const Restaurant = _Restaurant.init(sequelize, DataTypes);
  const ReteRestaurant = _ReteRestaurant.init(sequelize, DataTypes);
  const Roles = _Roles.init(sequelize, DataTypes);
  const SubFood = _SubFood.init(sequelize, DataTypes);
  const TypeFood = _TypeFood.init(sequelize, DataTypes);
  const User = _User.init(sequelize, DataTypes);

  Order.belongsTo(Food, { as: "food", foreignKey: "foodId"});
  Food.hasMany(Order, { as: "Orders", foreignKey: "foodId"});
  SubFood.belongsTo(Food, { as: "food", foreignKey: "foodId"});
  Food.hasMany(SubFood, { as: "SubFoods", foreignKey: "foodId"});
  LikeRate.belongsTo(Restaurant, { as: "re", foreignKey: "resId"});
  Restaurant.hasMany(LikeRate, { as: "LikeRates", foreignKey: "resId"});
  ReteRestaurant.belongsTo(Restaurant, { as: "re", foreignKey: "resId"});
  Restaurant.hasMany(ReteRestaurant, { as: "ReteRestaurants", foreignKey: "resId"});
  Food.belongsTo(TypeFood, { as: "type", foreignKey: "typeId"});
  TypeFood.hasMany(Food, { as: "Foods", foreignKey: "typeId"});
  LikeRate.belongsTo(User, { as: "user", foreignKey: "userId"});
  User.hasMany(LikeRate, { as: "LikeRates", foreignKey: "userId"});
  Order.belongsTo(User, { as: "user", foreignKey: "userId"});
  User.hasMany(Order, { as: "Orders", foreignKey: "userId"});
  ReteRestaurant.belongsTo(User, { as: "user", foreignKey: "userId"});
  User.hasMany(ReteRestaurant, { as: "ReteRestaurants", foreignKey: "userId"});

  return {
    Food,
    LikeRate,
    Order,
    Restaurant,
    ReteRestaurant,
    Roles,
    SubFood,
    TypeFood,
    User,
  };
}
