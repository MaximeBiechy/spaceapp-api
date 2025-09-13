import app from './app/app.js';
import { config } from './config/config.js';
import { initDatabase } from './config/database.js';
import logger, { logError } from './shared/utils/logger.js';

const PORT = config.port;

(async () => {
  try {
    initDatabase();

    app.listen(PORT, () => {
      logger.info(`[SERVER] running on http://localhost:${PORT}`);
    });
  } catch (error: any) {
    logError('[SERVER] Failed to start server', error);
    process.exit(1);
  }
})();
