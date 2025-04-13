import express from 'express';
import likeRouter from './like.routers';
import rateRouter from './rate.routers';
import oderRouter from './oder.routers';

const rootRouter = express.Router();

rootRouter.use(`/like`, likeRouter);
rootRouter.use(`/rate`, rateRouter);
rootRouter.use(`/order`, oderRouter);


export default rootRouter;