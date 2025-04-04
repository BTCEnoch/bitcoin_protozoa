# Run Bitcoin Integration Tests Script
# This script runs all the Bitcoin integration tests

Write-Host "Running Bitcoin Integration Tests..." -ForegroundColor Cyan
Write-Host "=======================================" -ForegroundColor Cyan

# Define paths
$srcDir = "src"
$bitcoinDomainDir = "$srcDir\domains\bitcoin"
$rngDomainDir = "$srcDir\domains\rng"

# Run Bitcoin API Service tests
Write-Host "Running Bitcoin API Service tests..." -ForegroundColor Yellow
npm test -- --testPathPattern=src/domains/bitcoin/services/__tests__/bitcoinApiService.test.ts

# Run Block Service tests
Write-Host "Running Block Service tests..." -ForegroundColor Yellow
npm test -- --testPathPattern=src/domains/bitcoin/services/blockService/__tests__/blockService.test.ts

# Run Confirmation Service tests
Write-Host "Running Confirmation Service tests..." -ForegroundColor Yellow
npm test -- --testPathPattern=src/domains/bitcoin/services/confirmationService/__tests__/confirmationService.test.ts

# Run Confirmation Tracker tests
Write-Host "Running Confirmation Tracker tests..." -ForegroundColor Yellow
npm test -- --testPathPattern=src/domains/bitcoin/services/__tests__/confirmationTracker.test.ts

# Run Bitcoin Store tests
Write-Host "Running Bitcoin Store tests..." -ForegroundColor Yellow
npm test -- --testPathPattern=src/domains/bitcoin/store/__tests__/bitcoinStore.test.ts

# Run Mulberry32 tests
Write-Host "Running Mulberry32 tests..." -ForegroundColor Yellow
npm test -- --testPathPattern=src/domains/rng/utils/__tests__/mulberry32.test.ts

# Run RNG Helpers tests
Write-Host "Running RNG Helpers tests..." -ForegroundColor Yellow
npm test -- --testPathPattern=src/domains/rng/utils/__tests__/rngHelpers.test.ts

# Run RNG Chain tests
Write-Host "Running RNG Chain tests..." -ForegroundColor Yellow
npm test -- --testPathPattern=src/domains/rng/utils/__tests__/rngChain.test.ts

# Run RNG Service tests
Write-Host "Running RNG Service tests..." -ForegroundColor Yellow
npm test -- --testPathPattern=src/domains/rng/services/rngService/__tests__/rngService.test.ts

# Run Chain RNG Service tests
Write-Host "Running Chain RNG Service tests..." -ForegroundColor Yellow
npm test -- --testPathPattern=src/domains/rng/services/chainRngService/__tests__/chainRngService.test.ts

Write-Host "All Bitcoin Integration Tests completed!" -ForegroundColor Green
