# blockService

**File:** `src/domains/bitcoin/services/blockService.ts`

## Bitcoin Block Service

```typescript
export class BlockService { {...}
```

## Creates a new BlockService instance

### Parameters

| Name | Type | Description |
|------|------|-------------|
| `apiBaseUrl` | `string` | Base URL for the Bitcoin block API |

## Fetches block data for the given block number from the Bitcoin API

### Parameters

| Name | Type | Description |
|------|------|-------------|
| `blockNumber` | `number` | The block number to fetch data for |

### Returns

**Type:** `Promise<any>`

The block data

### Throws

**Type:** `Error`

If the API request fails

## Extracts the nonce value from block data

### Parameters

| Name | Type | Description |
|------|------|-------------|
| `blockData` | `any` | The block data object |

### Returns

**Type:** `number`

The nonce value, or 0 if not found

## Gets the confirmation count for the given block

### Parameters

| Name | Type | Description |
|------|------|-------------|
| `blockData` | `any` | The block data object |

### Returns

**Type:** `number`

The confirmation count, or 0 if not found

