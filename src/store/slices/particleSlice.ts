/**
 * particleSlice
 *
 * @description Zustand store slice for  state
 */

import { StateCreator } from 'zustand';
import { RootState } from '../types';

export interface State {
  // State properties
}

export const createSlice: StateCreator<
  RootState,
  [],
  [],
  State
> = (set) => ({
  // Initial state and actions
});
