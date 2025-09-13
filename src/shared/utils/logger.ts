import { pino } from 'pino';
import pinoPretty from 'pino-pretty';

const logLevel = process.env.LOG_LEVEL || 'info';

// ? Pretty print logs
const prettyLogs = pinoPretty({
  colorize: true,
  translateTime: 'SYS:standard',
  ignore: 'pid,hostname',
});

const logger = pino(
  {
    level: logLevel,
    base: {
      service: 'spaceapp-api',
      environment: process.env.ENV || 'development',
    },
    timestamp: () => `,"time":"${new Date().toISOString()}"`,
  },
  prettyLogs
);

// ? Function to log errors with a message
export const logError = (message: string = 'An error occurred', error: any) => {
  logger.error({
    message,
    error: {
      name: error.name || 'Error',
      message: error.message || '',
      stack: error.stack || '',
    },
  });
};

export default logger;
