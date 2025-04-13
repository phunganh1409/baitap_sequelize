import express from 'express';
import { orderController } from '../controllers/oder.controllers';

const oderRouter = express.Router();
oderRouter.post("/add", orderController);

export default oderRouter;