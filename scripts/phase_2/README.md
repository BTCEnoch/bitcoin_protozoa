# Bitcoin Protozoa Phase 2 Implementation Scripts

This directory contains scripts for implementing Phase 2 (Bitcoin Integration) of the Bitcoin Protozoa project.

## Important Notes

1. We ONLY extract and use the nonce and confirmations fields from Bitcoin blocks
2. NO fallback mechanisms are implemented - we rely solely on Bitcoin ordinals endpoints
3. API endpoints:
   - Development: `https://ordinals.com/r/blockinfo/${blockNumber}`
   - Production: `/r/blockinfo/${blockNumber}`
4. Caching:
   - Block Data: 60000ms (1 minute)
   - Confirmation: 5000ms (5 seconds)

## Bitcoin Integration Implementation

These scripts will implement the Bitcoin Integration components for Phase 2 of the project:

- `implement-bitcoin-integration-master.ps1`: Master script for implementing Bitcoin Integration
- `implement-bitcoin-block-fetcher.ps1`: Implements Bitcoin block fetcher (ONLY nonce and confirmations)
- `implement-rng-system.ps1`: Implements Mulberry32 RNG algorithm and seeding from Bitcoin block nonce
- `implement-rng-utility-functions.ps1`: Implements utility functions for common RNG operations
- `implement-bitcoin-data-processing.ps1`: Implements block data parsing, validation, and confirmation tracking
- `implement-bitcoin-state-management-new.ps1`: Implements Bitcoin state management using Zustand
- `implement-bitcoin-data-visualization-new.ps1`: Implements Bitcoin data visualization components
- `implement-bitcoin-integration-tests-new.ps1`: Implements tests for Bitcoin API service
- `implement-bitcoin-integration-tests-new-part2.ps1`: Implements tests for Confirmation Tracker
- `implement-bitcoin-integration-tests-new-part3.ps1`: Implements tests for RNG system

## Usage

To implement the Bitcoin Integration, run the master script:

```powershell
.\implement-bitcoin-integration-master.ps1
```

This will guide you through the implementation process, allowing you to run each implementation script in sequence.

Alternatively, you can run individual scripts to implement specific components:

```powershell
.\implement-bitcoin-block-fetcher.ps1
.\implement-rng-system.ps1
.\implement-rng-utility-functions.ps1
# etc.
```

## Implementation Details

The implementation follows the project requirements outlined in the [Project Checklist](../../bitcoin_protozoa/project/01_project_checklist.md) and adheres to the architecture defined in the [Blockchain Integration](../../bitcoin_protozoa/bitcoin/01_blockchain_integration.md) document.

Key features to be implemented:

1. **Bitcoin API Service**: A service for fetching block data from the Bitcoin blockchain
2. **RNG System**: A deterministic random number generator seeded with Bitcoin block nonce
3. **Bitcoin Data Processing**: Processing and validation of Bitcoin block data
4. **Fallback Mechanisms**: Mechanisms for handling API failures and offline operation
5. **Bitcoin Integration Tests**: Comprehensive tests for Bitcoin integration components

## Next Steps

After implementing the Bitcoin Integration, the next phase will be Visual Traits Implementation, which will be implemented in a separate set of scripts.
