import React from 'react';
import * as THREE from 'three';

class BasicThree extends React.Component {
  private mount: React.RefObject<HTMLDivElement>;
  private scene: THREE.Scene | null = null;
  private camera: THREE.PerspectiveCamera | null = null;
  private renderer: THREE.WebGLRenderer | null = null;
  private cube: THREE.Mesh | null = null;
  private frameId: number | null = null;

  constructor(props: {}) {
    super(props);
    this.mount = React.createRef();
  }

  componentDidMount() {
    // Scene setup
    this.scene = new THREE.Scene();
    this.camera = new THREE.PerspectiveCamera(75, window.innerWidth / window.innerHeight, 0.1, 1000);
    this.renderer = new THREE.WebGLRenderer({ antialias: true });
    
    const width = this.mount.current?.clientWidth || window.innerWidth;
    const height = this.mount.current?.clientHeight || window.innerHeight;
    
    this.renderer.setSize(width, height);
    this.mount.current?.appendChild(this.renderer.domElement);
    
    // Create a cube
    const geometry = new THREE.BoxGeometry(1, 1, 1);
    const material = new THREE.MeshBasicMaterial({ color: 0xff9900 });
    this.cube = new THREE.Mesh(geometry, material);
    this.scene.add(this.cube);
    
    this.camera.position.z = 5;
    
    // Start animation
    this.start();
    
    // Handle window resize
    window.addEventListener('resize', this.handleResize);
  }
  
  componentWillUnmount() {
    this.stop();
    window.removeEventListener('resize', this.handleResize);
    this.mount.current?.removeChild(this.renderer!.domElement);
  }
  
  start = () => {
    if (!this.frameId) {
      this.frameId = requestAnimationFrame(this.animate);
    }
  }
  
  stop = () => {
    if (this.frameId) {
      cancelAnimationFrame(this.frameId);
      this.frameId = null;
    }
  }
  
  animate = () => {
    if (this.cube) {
      this.cube.rotation.x += 0.01;
      this.cube.rotation.y += 0.01;
    }
    
    this.renderScene();
    this.frameId = requestAnimationFrame(this.animate);
  }
  
  renderScene = () => {
    if (this.renderer && this.scene && this.camera) {
      this.renderer.render(this.scene, this.camera);
    }
  }
  
  handleResize = () => {
    if (this.camera && this.renderer && this.mount.current) {
      const width = this.mount.current.clientWidth;
      const height = this.mount.current.clientHeight;
      
      this.camera.aspect = width / height;
      this.camera.updateProjectionMatrix();
      this.renderer.setSize(width, height);
    }
  }
  
  render() {
    return (
      <div 
        ref={this.mount} 
        style={{ width: '100%', height: '400px', background: '#000' }}
      />
    );
  }
}

export default BasicThree;
