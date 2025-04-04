import { Canvas as ThreeCanvas } from '@react-three/fiber';
import { ReactNode } from 'react';

interface CanvasProps {
  children: ReactNode;
}

const Canvas = ({ children }: CanvasProps) => {
  return (
    <ThreeCanvas
      camera={{ position: [0, 0, 5], fov: 75 }}
      style={{ width: '100%', height: '100vh' }}
    >
      {children}
    </ThreeCanvas>
  );
};

export default Canvas;
