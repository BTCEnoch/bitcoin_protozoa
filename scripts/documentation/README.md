# Documentation Scripts

This directory contains scripts for generating documentation for the Bitcoin Protozoa project.

## Scripts

### `generate-api-docs.js`

Generates API documentation from JSDoc comments in TypeScript files.

**Usage:**

```bash
node scripts/documentation/generate-api-docs.js
```

**Features:**

- Extracts JSDoc comments from TypeScript files
- Parses JSDoc tags (parameters, returns, throws, examples, etc.)
- Generates Markdown documentation
- Creates an index file for easy navigation
- Includes code snippets for functions, classes, interfaces, and types

**Output:**

The script generates Markdown files in the `docs/api` directory, with one file per source file and an index file for navigation.

## Adding New Files to Document

To add new files to the documentation, edit the `files` array in `generate-api-docs.js`:

```javascript
const files = [
  'src/domains/particle/types.ts',
  'src/domains/particle/services/particleService/index.ts',
  // Add new files here
];
```

## JSDoc Guidelines

For best results, follow these JSDoc guidelines:

1. Use a title in the first line of the comment
2. Use `@param` tags for parameters with type, name, and description
3. Use `@returns` tags for return values with type and description
4. Use `@throws` tags for exceptions with type and description
5. Use `@example` tags for code examples
6. Use `@see` tags for related documentation

Example:

```typescript
/**
 * Calculate the distance between two points
 * 
 * This function calculates the Euclidean distance between two points in 3D space.
 * 
 * @param {Vector3} point1 - The first point
 * @param {Vector3} point2 - The second point
 * @returns {number} The distance between the points
 * @throws {Error} If either point is null or undefined
 * @example
 * const distance = calculateDistance(new Vector3(0, 0, 0), new Vector3(1, 1, 1));
 * console.log(distance); // 1.732
 * @see Vector3
 */
function calculateDistance(point1, point2) {
  // Implementation
}
```
