import express from 'express';
import cors from 'cors';
import routes from '../interface/routes/v1/index.js';

const app = express();
app.use(cors());
app.use(express.json());

// Define routes here
app.use('/api/v1', routes);

// Error handling middleware TODO

export default app;
