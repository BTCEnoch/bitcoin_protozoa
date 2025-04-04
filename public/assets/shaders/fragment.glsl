// Fragment Shader
// This is a placeholder for a fragment shader

precision highp float;

varying vec2 vUv;

uniform vec3 color;
uniform float opacity;

void main() {
  gl_FragColor = vec4(color, opacity);
}
