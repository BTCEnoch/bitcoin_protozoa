import { useState, useEffect } from 'react';
import { BlockService } from '../services/blockService';

/**
 * Hook for fetching and using Bitcoin block data
 * IMPORTANT: We ONLY extract and use the nonce and confirmations fields from Bitcoin blocks.
 * Part of Phase 1 implementation
 */
export const useBlockData = (blockNumber: number) => {
  const [blockData, setBlockData] = useState<{nonce: number, confirmations: number} | null>(null);
  const [loading, setLoading] = useState<boolean>(true);
  const [error, setError] = useState<Error | null>(null);

  useEffect(() => {
    const blockService = new BlockService();

    const fetchData = async () => {
      try {
        setLoading(true);
        const data = await blockService.fetchBlockData(blockNumber);
        setBlockData(data);
        setError(null);
      } catch (err) {
        setError(err instanceof Error ? err : new Error(String(err)));
      } finally {
        setLoading(false);
      }
    };

    fetchData();

    return () => {
      // Cleanup
    };
  }, [blockNumber]);

  return { blockData, loading, error };
};
