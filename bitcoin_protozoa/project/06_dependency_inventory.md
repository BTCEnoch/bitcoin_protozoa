# Dependency Inventory

This document provides a comprehensive inventory of all dependencies used in the Bitcoin Protozoa project, including their required versions that match Bitcoin inscriptions. This inventory ensures compatibility with on-chain resources and prepares for the eventual migration from npm local installs to inscription sources.

## Table of Contents

1. [Core Principles](#core-principles)
2. [Core Dependencies](#core-dependencies)
3. [3D Rendering Dependencies](#3d-rendering-dependencies)
4. [Animation & Effects Dependencies](#animation--effects-dependencies)
5. [Utility Dependencies](#utility-dependencies)
6. [Development Dependencies](#development-dependencies)
7. [Migration Strategy](#migration-strategy)
8. [Dependency Verification](#dependency-verification)

## Core Principles

1. **Version Exactness**: All dependencies must match the exact versions available as Bitcoin inscriptions
2. **Compatibility Verification**: Regular verification ensures our installed versions match inscription versions
3. **No Fallbacks**: The final application will rely solely on Bitcoin inscriptions with no fallbacks
4. **Minimal Footprint**: Only essential dependencies are included to minimize the application size
5. **Inscription Preparation**: Dependencies not yet inscribed will be prepared for inscription

## Core Dependencies

| Dependency | Required Version | Inscription ID | Current Status | Notes |
|------------|------------------|----------------|----------------|-------|
| React | 18.2.0 | 7f403153b6484f7d24f50a51e1cdf8187219a3baf103ef0df5ea2437fb9de874i0 | ✅ Aligned | Core UI framework |
| ReactDOM | 18.2.0 | 89295aaf617708128b95d22e7099ce32108d4b918386e6f90994e7979d22ba72i0 | ✅ Aligned | DOM manipulation for React |
| Scheduler | 0.23.0 | 9b09a0f234355106e9311a21fbe5324c90f7317f04c00bc73e1114c9af745743i0 | ✅ Aligned | Required React dependency |
| React Reconciler | 0.27.0 | 9b0338c4e84987a374845235a3b4f0fe73b205b336a7b936e05c71deb5a1882ci0 | ⚠️ Not installed | React reconciliation engine |

## 3D Rendering Dependencies

| Dependency | Required Version | Inscription ID | Current Status | Notes |
|------------|------------------|----------------|----------------|-------|
| Three.js | 0.163.0 | 2dbdf9ebbec6be793fd16ae9b797c7cf968ab2427166aaf390b90b71778266abi0 | ✅ Aligned | Core 3D rendering engine |
| React Three Fiber | 8.13.7 | 24c424c795d50c3f1d344253d163e7eaa34e904aef038b6031d706e76676c634i0 | ✅ Aligned | React bindings for Three.js |
| React Three Drei | 9.80.7 | 9f77a1efc4c880197ba8d197d5e87539443ed5ebcf027b1fee25db8bd1cf4605i0 | ✅ Aligned | Useful helpers for React Three Fiber |
| GLTFLoader | latest | 614855c7c7541594c846a96a81db7bcedaff2831711e3b89670aba4c2fefb404i0 | ⚠️ Not installed | For loading 3D models |
| TextGeometry | latest | 77ef4bc8b15f0a764903f3bb2ccd0566ac6c111bd3d884bc814cfde49565dbc9i0 | ⚠️ Not installed | For 3D text rendering |
| FontLoader | latest | fcacfdd75ef21965ec98d9a1a107e8f5468f23ff15131cae44fc6aca86538147i0 | ⚠️ Not installed | For loading fonts in Three.js |
| BufferGeometryUtils | latest | 71616486e00954e0087b6bfd6b110fe0a32d1b174b94b634b34f27dd04f70a5ci0 | ⚠️ Not installed | Buffer geometry utilities |

## Animation & Effects Dependencies

| Dependency | Required Version | Inscription ID | Current Status | Notes |
|------------|------------------|----------------|----------------|---------|
| GSAP | 3.6.1 | 6577ec768235a2a911e91a115b964618581bde91d99bc58f5c7390fdfb155ae6i0 | ⚠️ Not installed | Animation library |
| React-spring-core | 9.7.3 | 09fe4a18d81abc481597bdd9ddfa65aadb95defc18de3ec925ec0b45ac3c7c49i0 | ⚠️ Not installed | Physics-based animations |
| Shader-composer | 0.4.3 | 1c9c11c3b82bce54bfa989a44a1057f8c39d3b8b9dc2e13ec1f99e4a0f3a0f77i0 | ✅ Aligned | WebGL shader composition |
| vfx-composer | 0.4.0 | 9f59e26bc81e4d741f77320eaf9e9df8cce623c9639f9c1a49497ac75607e9bei0 | ✅ Aligned | Visual effects composition |
| Chroma | latest | c49f28a5c9e67efb85d44b9ee12efa2839b0251bad14efc5e6c32406505e259ci0 | ⚠️ Not installed | Color manipulation |

## Utility Dependencies

| Dependency | Required Version | Inscription ID | Current Status | Notes |
|------------|------------------|----------------|----------------|---------|
| Crypto-js | 4.1.1 | 66979aec90e592bc5be7fddcef23daeff982662b7225e7804c1b271f1b0d267ai0 | ⚠️ Not installed | Cryptography functions |
| Pako | 2.1.0 | fba6f95fb1152db43304a27dce8cb8c65509eba6ab0b6958cedeb33e5f443077i0 | ⚠️ Not installed | Compression library |
| JSZip | 3.10.1 | 372c5388030820daed356d25d7a1218d0b88d78a6d051d27c91d0f25ac4c3c5ei0 | ⚠️ Not installed | File compression/decompression |
| fflate | 0.8.0 | 657973995aa2a47c3fe02debb22405dadf6b49148d97027627bced89a73f408fi0 | ⚠️ Not installed | Fast compression library |
| Buffer | latest | fb15f2a6ed1d3031aa214cc12d3fa696508080c0baa194463920c8a79d21aa54i0 | ⚠️ Not installed | Binary data handling |
| brotli/decode.min.js | latest | b1d16a7a1ada08b5c7f51837478f578c0abd0973809c439228f28ccd5c38e44ai0 | ⚠️ Not installed | Decompression utility |
| Moment.js | 2.29.1 | b90b4516ea1a0b882e67387eb4f3e5def0307704b046e8ef98c5e72092c47eedi0 | ⚠️ Not installed | Date/time library |
| Axios | latest | 6b81993428a217a341ffd68f3b3aa3664b2cfc674d57aad0d3b6daa0f125b821i0 | ⚠️ Not installed | HTTP client |
| Highlight.js | 11.7.0 | 41d856597a8474e7124a0641b54afb77bc034f800e1be8fe02a20b55023ff4a7i0 | ⚠️ Not installed | Syntax highlighting |
| GRC-img | v1 | e5ef65604e1ad9c90fb3c74918e00a960ce2e814fba412556afec6b3a4e25257i0 | ⚠️ Not installed | Image processing |
| Open Ordinal Stitch | 0.9.0 | a196634768a6a715779fa8d513b65b8d2099defc2bd09c36dccbf54ffdd04022i0 | ⚠️ Not installed | Ordinals utility |
| Zustand | 4.4.6 | Not inscribed | ✅ Aligned | State management library |

## CSS & UI Dependencies

| Dependency | Required Version | Inscription ID | Current Status | Notes |
|------------|------------------|----------------|----------------|---------|
| Tailwind | latest | 0703423f633ed5cef7e3b45bfd8df43ab0d6783850d51005b105f01dd60d25c3i0 | ⚠️ Not installed | CSS framework |
| Bitcoin Icons | 1.0 | 01a4ff05b7591d14afa8a70aa80fd17b49e972f34a65bf69c6fc5ea09f08ab04i0 | ⚠️ Not installed | Bitcoin-specific icons |
| Lucide Icons | 0.363.0 | 5546e0dea8b7fc991ef3ae22802ee7e793f814049ae9f32409ced33739840137i0 | ⚠️ Not installed | General UI icons |
| @emotion/react | 11.14.0 | Not inscribed | ✅ Aligned | CSS-in-JS library |
| @emotion/styled | 11.14.0 | Not inscribed | ✅ Aligned | Styled components for Emotion |

## Development Dependencies

| Dependency | Required Version | Current Status | Notes |
|------------|------------------|----------------|-------|
| TypeScript | 5.0.4 | ✅ Aligned | Programming language |
| Vite | 4.3.2 | ✅ Aligned | Build tool |
| ESLint | 8.38.0 | ✅ Aligned | Code linting |
| Prettier | 2.8.7 | ✅ Aligned | Code formatting |
| Vitest | 0.30.1 | ✅ Aligned | Testing framework |
| @testing-library/react | 13.4.0 | ✅ Aligned | React testing utilities |
| @testing-library/jest-dom | 5.16.5 | ✅ Aligned | DOM testing utilities |
| @types/react | 18.0.28 | ✅ Aligned | React type definitions |
| @types/react-dom | 18.0.11 | ✅ Aligned | React DOM type definitions |
| @types/three | 0.152.1 | ⚠️ Version mismatch | Three.js type definitions |

## Migration Strategy

### Phase 1: Version Alignment (Current)

- Ensure all installed dependencies match the versions available as inscriptions
- Document any dependencies that need to be inscribed
- Maintain compatibility with inscription versions during development

### Phase 2: Inscription Preparation

- Prepare any custom dependencies for inscription
- Create minimal builds of dependencies where possible
- Test application with local versions of inscription-ready dependencies

### Phase 3: Inscription Migration

- Replace npm imports with inscription imports
- Implement the InscriptionLoaderService
- Test application with actual inscriptions
- Remove all npm dependencies from the final build

## Dependency Verification

To verify that our dependencies match the required versions:

```bash
npm list --depth=0
```

This will show the top-level dependencies and their installed versions, which can be compared against this inventory.

### Custom Dependencies

The following dependencies are not yet inscribed and may need custom inscription:

- @emotion/react (11.14.0)
- @emotion/styled (11.14.0)

### Related Documents

- [Bitcoin On-Chain Resources](../../BITCOIN_ONCHAIN_RESOURCES.md) - Source for inscription IDs
- [Project Checklist](./01_project_checklist.md) - Project requirements and milestones
- [Directory Structure Map](./05_directory_structure_map.md) - Project structure
