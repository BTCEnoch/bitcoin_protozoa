/**
 * Styles for TraitVisualizer component
 */
import { css } from '@emotion/react';

export const TraitVisualizerStyles = css`
  .trait-visualizer {
    display: flex;
    flex-direction: column;
    width: 100%;
    height: 100%;
    min-height: 400px;
    background-color: #1a1a1a;
    border-radius: 8px;
    overflow: hidden;
  }

  .trait-visualizer__header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 16px;
    background-color: #2a2a2a;
    border-bottom: 1px solid #3a3a3a;
  }

  .trait-visualizer__title {
    font-size: 18px;
    font-weight: 600;
    color: #f7931a;
    margin: 0;
  }

  .trait-visualizer__controls {
    display: flex;
    flex-wrap: wrap;
    gap: 16px;
    padding: 16px;
    background-color: #2a2a2a;
    border-bottom: 1px solid #3a3a3a;
  }

  .trait-visualizer__control-group {
    display: flex;
    flex-direction: column;
    gap: 8px;
  }

  .trait-visualizer__label {
    font-size: 14px;
    font-weight: 500;
    color: #ffffff;
  }

  .trait-visualizer__select {
    padding: 8px 12px;
    background-color: #3a3a3a;
    border: 1px solid #4a4a4a;
    border-radius: 4px;
    color: #ffffff;
    font-size: 14px;
    min-width: 150px;
  }

  .trait-visualizer__canvas-container {
    flex: 1;
    position: relative;
    overflow: hidden;
  }

  .trait-visualizer__canvas {
    width: 100%;
    height: 100%;
  }

  .trait-visualizer__info-panel {
    position: absolute;
    bottom: 16px;
    right: 16px;
    background-color: rgba(0, 0, 0, 0.7);
    padding: 12px;
    border-radius: 4px;
    color: #ffffff;
    font-size: 14px;
    max-width: 300px;
  }

  .trait-visualizer__info-title {
    font-weight: 600;
    margin-bottom: 8px;
    color: #f7931a;
  }

  .trait-visualizer__info-item {
    margin-bottom: 4px;
  }

  .trait-visualizer__color-preview {
    display: inline-block;
    width: 16px;
    height: 16px;
    border-radius: 50%;
    margin-right: 8px;
    vertical-align: middle;
  }

  .trait-visualizer__tabs {
    display: flex;
    background-color: #2a2a2a;
    border-bottom: 1px solid #3a3a3a;
  }

  .trait-visualizer__tab {
    padding: 12px 16px;
    font-size: 14px;
    font-weight: 500;
    color: #cccccc;
    cursor: pointer;
    border-bottom: 2px solid transparent;
    transition: all 0.2s ease;
  }

  .trait-visualizer__tab--active {
    color: #f7931a;
    border-bottom-color: #f7931a;
  }

  .trait-visualizer__tab:hover {
    color: #ffffff;
  }
`;
