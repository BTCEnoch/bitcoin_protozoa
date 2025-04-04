import { describe, it, expect, beforeEach, vi, afterEach } from 'vitest';
import { BlockService } from '@/domains/bitcoin/services/blockService';
import { createMockBlockData } from '../../../utils/fixtures';

// Mock fetch
global.fetch = vi.fn();

describe('BlockService', () => {
  let blockService: BlockService;

  beforeEach(() => {
    blockService = new BlockService('test-api');
    vi.clearAllMocks();
  });

  afterEach(() => {
    vi.resetAllMocks();
  });

  it('should fetch block data', async () => {
    const mockBlockData = createMockBlockData(12345);

    // Mock successful response
    (global.fetch as any).mockResolvedValueOnce({
      ok: true,
      json: async () => mockBlockData,
    });

    const result = await blockService.fetchBlockData(12345);

    expect(global.fetch).toHaveBeenCalledWith('test-api/12345');
    expect(result).toEqual(mockBlockData);
  });

  it('should handle fetch errors', async () => {
    // Mock failed response
    (global.fetch as any).mockResolvedValueOnce({
      ok: false,
      statusText: 'Not Found',
    });

    await expect(blockService.fetchBlockData(12345)).rejects.toThrow('Failed to fetch block data: Not Found');
  });

  // Add more tests as the service is implemented
});
