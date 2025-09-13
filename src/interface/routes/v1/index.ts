import { Request, Response, Router } from 'express';
// Routes
import objectsRoutes from './objectsRoutes.js';

const router = Router();

// Simple route to check if the API is running
router.get('/', (req: Request, res: Response) => {
  res.json({ message: 'API is running' });
});

// Define routes here
router.use('/objects', objectsRoutes);

export default router;
