/**
 * API Documentation Generator Script
 * 
 * This script generates Markdown documentation from JSDoc comments in TypeScript files.
 * It extracts JSDoc comments, parses them, and generates Markdown files.
 * 
 * Usage: node scripts/documentation/generate-api-docs.js
 */

import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

// Get the directory name of the current module
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

// Create docs directory if it doesn't exist
const docsDir = path.join(__dirname, '../../docs/api');
if (!fs.existsSync(docsDir)) {
  fs.mkdirSync(docsDir, { recursive: true });
}

// Files to document
const files = [
  'src/domains/particle/types.ts',
  'src/domains/particle/services/particleService/index.ts',
  'src/domains/particle/services/particleService/creation.ts',
  'src/domains/physics/services/physicsService/index.ts',
  'src/domains/physics/utils/integrationUtils.ts',
  'src/domains/physics/utils/vectorUtils.ts',
  'src/domains/bitcoin/services/blockService.ts'
];

console.log('Starting API documentation generation...');

// Process each file
files.forEach(filePath => {
  try {
    const fullPath = path.join(__dirname, '../..', filePath);
    console.log(`Processing ${filePath}...`);
    
    // Read file content
    const content = fs.readFileSync(fullPath, 'utf8');
    
    // Extract JSDoc comments
    const jsdocBlocks = extractJSDocBlocks(content);
    console.log(`Found ${jsdocBlocks.length} JSDoc blocks in ${filePath}`);
    
    // Generate markdown
    const markdown = generateMarkdown(filePath, jsdocBlocks);
    
    // Write to file
    const filename = path.basename(filePath, path.extname(filePath));
    const outputPath = path.join(docsDir, `${filename}.md`);
    fs.writeFileSync(outputPath, markdown);
    
    console.log(`Generated documentation for ${filePath} at ${outputPath}`);
  } catch (error) {
    console.error(`Error processing ${filePath}:`, error);
  }
});

// Generate index file
generateIndexFile(files);

console.log('API documentation generation complete!');

/**
 * Extracts JSDoc blocks from file content
 * 
 * @param {string} content - File content
 * @returns {Array<{comment: string, code: string}>} Array of JSDoc blocks
 */
function extractJSDocBlocks(content) {
  const blocks = [];
  const regex = /\/\*\*\s*([\s\S]*?)\s*\*\/\s*([\s\S]*?)(?=\/\*\*|$)/g;
  
  let match;
  while ((match = regex.exec(content)) !== null) {
    const comment = match[1].replace(/^\s*\*\s?/gm, '').trim();
    const code = match[2].trim();
    
    blocks.push({ comment, code });
  }
  
  return blocks;
}

/**
 * Generates markdown documentation from JSDoc blocks
 * 
 * @param {string} filePath - File path
 * @param {Array<{comment: string, code: string}>} blocks - JSDoc blocks
 * @returns {string} Markdown content
 */
function generateMarkdown(filePath, blocks) {
  const filename = path.basename(filePath, path.extname(filePath));
  let markdown = `# ${filename}\n\n`;
  
  // Add file path
  markdown += `**File:** \`${filePath}\`\n\n`;
  
  // Process each block
  blocks.forEach((block, index) => {
    const { comment, code } = block;
    
    // Parse JSDoc comment
    const parsed = parseJSDocComment(comment);
    
    // Add section title
    const title = parsed.description.split('\n')[0] || `Section ${index + 1}`;
    markdown += `## ${title}\n\n`;
    
    // Add description (excluding first line which is the title)
    const description = parsed.description.split('\n').slice(1).join('\n').trim();
    if (description) {
      markdown += `${description}\n\n`;
    }
    
    // Add code example if it's a function or class declaration
    if (code && (code.includes('function') || code.includes('class') || code.includes('interface') || code.includes('type'))) {
      const codePreview = code.split('\n')[0].trim() + (code.includes('{') ? ' {...}' : '');
      markdown += `\`\`\`typescript\n${codePreview}\n\`\`\`\n\n`;
    }
    
    // Add parameters table
    if (parsed.params.length > 0) {
      markdown += `### Parameters\n\n`;
      markdown += `| Name | Type | Description |\n`;
      markdown += `|------|------|-------------|\n`;
      
      parsed.params.forEach(param => {
        markdown += `| \`${param.name}\` | \`${param.type}\` | ${param.description} |\n`;
      });
      
      markdown += '\n';
    }
    
    // Add returns
    if (parsed.returns) {
      markdown += `### Returns\n\n`;
      markdown += `**Type:** \`${parsed.returns.type}\`\n\n`;
      markdown += `${parsed.returns.description}\n\n`;
    }
    
    // Add throws
    if (parsed.throws) {
      markdown += `### Throws\n\n`;
      markdown += `**Type:** \`${parsed.throws.type}\`\n\n`;
      markdown += `${parsed.throws.description}\n\n`;
    }
    
    // Add examples
    if (parsed.examples.length > 0) {
      markdown += `### Examples\n\n`;
      
      parsed.examples.forEach(example => {
        markdown += `\`\`\`typescript\n${example}\n\`\`\`\n\n`;
      });
    }
    
    // Add see also
    if (parsed.see.length > 0) {
      markdown += `### See Also\n\n`;
      
      parsed.see.forEach(see => {
        markdown += `- ${see}\n`;
      });
      
      markdown += '\n';
    }
  });
  
  return markdown;
}

/**
 * Parses a JSDoc comment into structured data
 * 
 * @param {string} comment - JSDoc comment
 * @returns {Object} Parsed comment
 */
function parseJSDocComment(comment) {
  const result = {
    description: '',
    params: [],
    returns: null,
    throws: null,
    examples: [],
    see: []
  };
  
  // Split into lines
  const lines = comment.split('\n');
  
  // Extract tags
  let currentTag = null;
  let currentTagContent = '';
  let descriptionLines = [];
  
  lines.forEach(line => {
    const tagMatch = line.match(/^@(\w+)(?:\s+(.*))?$/);
    
    if (tagMatch) {
      // Save previous tag content
      if (currentTag) {
        processTagContent(result, currentTag, currentTagContent);
      }
      
      // Start new tag
      currentTag = tagMatch[1];
      currentTagContent = tagMatch[2] || '';
    } else if (currentTag) {
      // Continue previous tag
      currentTagContent += '\n' + line.trim();
    } else {
      // Part of description
      descriptionLines.push(line);
    }
  });
  
  // Save last tag content
  if (currentTag) {
    processTagContent(result, currentTag, currentTagContent);
  }
  
  // Set description
  result.description = descriptionLines.join('\n').trim();
  
  return result;
}

/**
 * Processes a tag and its content
 * 
 * @param {Object} result - Result object
 * @param {string} tag - Tag name
 * @param {string} content - Tag content
 */
function processTagContent(result, tag, content) {
  switch (tag) {
    case 'param':
    case 'parameter':
      const paramMatch = content.match(/^\{([^}]+)\}\s+(\w+)(?:\s+-\s+(.*))?$/);
      if (paramMatch) {
        result.params.push({
          type: paramMatch[1],
          name: paramMatch[2],
          description: (paramMatch[3] || '').trim()
        });
      }
      break;
      
    case 'returns':
    case 'return':
      const returnMatch = content.match(/^\{([^}]+)\}(?:\s+(.*))?$/);
      if (returnMatch) {
        result.returns = {
          type: returnMatch[1],
          description: (returnMatch[2] || '').trim()
        };
      }
      break;
      
    case 'throws':
    case 'throw':
      const throwsMatch = content.match(/^\{([^}]+)\}(?:\s+(.*))?$/);
      if (throwsMatch) {
        result.throws = {
          type: throwsMatch[1],
          description: (throwsMatch[2] || '').trim()
        };
      }
      break;
      
    case 'example':
      result.examples.push(content.trim());
      break;
      
    case 'see':
      result.see.push(content.trim());
      break;
  }
}

/**
 * Generates an index file for the documentation
 * 
 * @param {Array<string>} files - Array of file paths
 */
function generateIndexFile(files) {
  const indexPath = path.join(docsDir, 'index.md');
  let content = '# API Documentation\n\n';
  
  // Add links to each file
  content += '## Files\n\n';
  
  files.forEach(filePath => {
    const filename = path.basename(filePath, path.extname(filePath));
    content += `- [${filename}](${filename}.md) - \`${filePath}\`\n`;
  });
  
  // Add sections
  content += '\n## Sections\n\n';
  content += '- [Particle System](types.md)\n';
  content += '- [Particle Service](index.md)\n';
  content += '- [Physics Service](index.md)\n';
  content += '- [Integration Utilities](integrationUtils.md)\n';
  content += '- [Vector Utilities](vectorUtils.md)\n';
  content += '- [Bitcoin Block Service](blockService.md)\n';
  
  // Write to file
  fs.writeFileSync(indexPath, content);
  console.log(`Generated index file at ${indexPath}`);
}
