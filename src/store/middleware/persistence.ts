/**
 * persistence Middleware
 *
 * @description Zustand middleware for persistence functionality
 */

import { StateCreator, StoreApi, StoreMutatorIdentifier } from 'zustand';
import { RootState } from '../types';

type MiddlewareImpl = <
  T,
  Mps extends [StoreMutatorIdentifier, unknown][] = [],
  Mcs extends [StoreMutatorIdentifier, unknown][] = []
>(
  f: StateCreator<T, Mps, Mcs>,
  api: StoreApi<T>
) => StateCreator<T, Mps, Mcs>;

export const persistenceMiddleware: MiddlewareImpl = (f, api) => (set, get, store) => {
  // Middleware implementation

  return f(
    (...args) => {
      // Custom logic before state update
      set(...args);
      // Custom logic after state update
    },
    get,
    store
  );
};
