import { config } from './config.js';
import PostgresClient from '../infrastructure/database/PostgresClient.js';

export function initDatabase(): void {
  const DB_URI: string = config.db.uri;

  if (!DB_URI || DB_URI.trim() === '') {
    throw new Error('[DB] Database URI not provided in environment variables');
  }

  PostgresClient.init(DB_URI);
}
