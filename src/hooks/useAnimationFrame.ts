import { useRef, useEffect } from 'react';

/**
 * Hook for using requestAnimationFrame
 * @param callback - Callback function to run on each frame
 */
export const useAnimationFrame = (callback: (deltaTime: number) => void) => {
  // Store callback in a ref
  const callbackRef = useRef(callback);
  
  // Update callback ref when callback changes
  useEffect(() => {
    callbackRef.current = callback;
  }, [callback]);
  
  // Set up animation frame
  useEffect(() => {
    let frameId: number;
    let lastTime = 0;
    
    const animate = (time: number) => {
      // Calculate delta time in seconds
      const deltaTime = Math.min((time - lastTime) / 1000, 0.1); // Cap at 0.1s to prevent large jumps
      lastTime = time;
      
      // Call the callback
      callbackRef.current(deltaTime);
      
      // Request next frame
      frameId = requestAnimationFrame(animate);
    };
    
    // Start animation
    frameId = requestAnimationFrame(animate);
    
    // Clean up on unmount
    return () => {
      cancelAnimationFrame(frameId);
    };
  }, []);
};
