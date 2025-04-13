import express from 'express';
import { likeController } from '../controllers/like.controllers';

const likeRouter = express.Router();

likeRouter.post('/like', likeController.like);
likeRouter.post('/unlike', likeController.unlike);
likeRouter.get('/restaurant/:resId', likeController.getByRestaurant);
likeRouter.get('/user/:userId/likes', likeController.getByUser);   

export default likeRouter;