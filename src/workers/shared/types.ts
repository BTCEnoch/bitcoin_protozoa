/**
 * Shared Worker Types
 *
 * @description Type definitions for shared worker functionality
 */

export interface WorkerMessage {
  type: string;
  payload?: any;
}

export interface WorkerResponse {
  type: string;
  payload?: any;
  error?: string;
}
