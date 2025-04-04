/**
 * UI Store Hook
 *
 * @description Hook for accessing UI-related state from the global store
 */

import { useStore } from '../../../store';

/**
 * Hook for accessing UI-related state
 */
export const useUIStore = () => {
  const showControls = useStore((state) => state.showControls);
  const showGlow = useStore((state) => state.showGlow);
  const showTrails = useStore((state) => state.showTrails);
  const backgroundColor = useStore((state) => state.backgroundColor);
  const setShowControls = useStore((state) => state.setShowControls);
  const setShowGlow = useStore((state) => state.setShowGlow);
  const setShowTrails = useStore((state) => state.setShowTrails);
  const setBackgroundColor = useStore((state) => state.setBackgroundColor);
  
  return {
    showControls,
    showGlow,
    showTrails,
    backgroundColor,
    setShowControls,
    setShowGlow,
    setShowTrails,
    setBackgroundColor
  };
};
