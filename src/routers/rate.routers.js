import express from 'express';
import { rateController } from '../controllers/rate.controllers';


const rateRouter = express.Router();

rateRouter.post("/", rateController.addRate);
rateRouter.get("/restaurant/:resId", rateController.getRatesByRestaurant);
rateRouter.get("/user/:userId", rateController.getRatesByUser);

export default rateRouter;