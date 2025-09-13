import { Pool } from 'pg';
import logger from '../../shared/utils/logger.js';

class PostgresClient {
  private static pool: Pool;

  static init(uri: string): void {
    if (!this.pool) {
      this.pool = new Pool({
        connectionString: uri,
      });
      logger.info('[DB] PostgreSQL client initialized');
    }
  }

  static getPool(): Pool {
    if (!this.pool) {
      throw new Error('[DB] PostgreSQL client not initialized. Call init() first.');
    }
    return this.pool;
  }

  static async disconnect(): Promise<void> {
    if (this.pool) {
      await this.pool.end();
      logger.info('[DB] PostgreSQL client disconnected');
    }
  }
}

export default PostgresClient;
