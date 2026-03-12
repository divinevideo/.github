# Divine

**Short-form looping video on the decentralized web**

Divine is an open-source platform for sharing 6-second looping videos, built on [Nostr](https://nostr.com) — a decentralized social protocol. Think Vine, but nobody owns it and nobody can shut it down.

## What We're Building

Divine brings back the magic of short-form looping video in a way that's:
- **Decentralized** — No single company controls your content or social graph
- **Open Source** — All our code is public and contributions are welcome
- **Interoperable** — Your videos and followers work across any Nostr client
- **Censorship Resistant** — Content lives on multiple relays, not one server

## Architecture

### Frontend Applications

| Repository | Stack | Description |
|------------|-------|-------------|
| [divine-web](https://github.com/divinevideo/divine-web) | React + TypeScript + Vite | Web app at [divine.video](https://divine.video) |
| [divine-mobile](https://github.com/divinevideo/divine-mobile) | Flutter | Native iOS and Android apps |
| [divine-space](https://github.com/divinevideo/divine-space) | React + TypeScript + Vite | MySpace-inspired video social network on Nostr |
| [divine-relay-manager](https://github.com/divinevideo/divine-relay-manager) | React + TypeScript + Vite | Nostr relay management dashboard |

### Core Backend Services

| Repository | Stack | Description |
|------------|-------|-------------|
| [divine-funnelcake](https://github.com/divinevideo/divine-funnelcake) | Rust / Axum | Nostr relay + REST API + ClickHouse analytics ([relay.divine.video](https://relay.divine.video) / [api.divine.video](https://api.divine.video)) |
| [keycast](https://github.com/divinevideo/keycast) | Rust / Axum | OAuth 2.0 + NIP-46 remote signing + UCAN tokens ([login.divine.video](https://login.divine.video)) |
| [divine-blossom](https://github.com/divinevideo/divine-blossom) | Rust / Fastly Compute | Content-addressed media storage via Blossom protocol ([media.divine.video](https://media.divine.video)) |
| [divine-inquisitor](https://github.com/divinevideo/divine-inquisitor) | Rust / Axum | C2PA Content Credentials verification service |
| [divine-relay-sync](https://github.com/divinevideo/divine-relay-sync) | Rust | Sync Nostr events between relays using NIP-77 negentropy |
| [funnel](https://github.com/divinevideo/funnel) | Rust | Analytics pipeline and REST API |

### Trust & Safety

| Repository | Stack | Description |
|------------|-------|-------------|
| [divine-moderation-service](https://github.com/divinevideo/divine-moderation-service) | Cloudflare Worker | Human-in-the-loop content moderation — NSFW, violence, AI-generated, and deepfake detection via Hive.AI + Reality Defender |
| [divine-moderation-api](https://github.com/divinevideo/divine-moderation-api) | Cloudflare Worker | Public API for content moderation — queue producer + status checker |
| [divine-realness](https://github.com/divinevideo/divine-realness) | — | Multi-provider deepfake detection for Nostr video events |
| [osprey](https://github.com/divinevideo/osprey) | Rust | High-performance safety rules engine for real-time event processing at scale |
| [social-media-age-rules-db](https://github.com/divinevideo/social-media-age-rules-db) | — | Global social media age regulations database with admin UI |

### Edge & Infrastructure

| Repository | Stack | Description |
|------------|-------|-------------|
| [divine-cdn-worker](https://github.com/divinevideo/divine-cdn-worker) | Cloudflare Worker | Media CDN and Blossom server ([cdn.divine.video](https://cdn.divine.video)) |
| [divine-router](https://github.com/divinevideo/divine-router) | Rust / Fastly Compute | Edge router for divine.video subdomains |
| [divine-name-server](https://github.com/divinevideo/divine-name-server) | Cloudflare Worker | NIP-05 name server |
| [divine-name-sync](https://github.com/divinevideo/divine-name-sync) | — | NIP-05 name synchronization |
| [divine-rest-gateway](https://github.com/divinevideo/divine-rest-gateway) | Cloudflare Worker | REST API caching proxy for Nostr |
| [divine-push-service](https://github.com/divinevideo/divine-push-service) | — | Push notification service for the mobile app |
| [divine-identify-verification-service](https://github.com/divinevideo/divine-identify-verification-service) | Cloudflare Worker | Identity and verification service |
| [divine-github-actions](https://github.com/divinevideo/divine-github-actions) | GitHub Actions | Reusable CI/CD workflows for Divine repositories |

### Libraries & SDKs

| Repository | Stack | Description |
|------------|-------|-------------|
| [keycast_flutter_demo](https://github.com/divinevideo/keycast_flutter_demo) | Flutter / Dart | Keycast Flutter library and demo app for OAuth + PKCE + BYOK Nostr signing |
| [c2pa-flutter](https://github.com/divinevideo/c2pa-flutter) | Flutter / Dart | Flutter wrapper for the official C2PA mobile SDKs |
| [c2pa-rs](https://github.com/divinevideo/c2pa-rs) | Rust | Fork of the C2PA Rust SDK for content provenance and authenticity |
| [media-kit](https://github.com/divinevideo/media-kit) | Flutter / Dart | Fork of cross-platform video & audio player for Flutter |

### Other

| Repository | Description |
|------------|-------------|
| [divine-resurrection](https://github.com/divinevideo/divine-resurrection) | Legacy identity recovery for former Vine creators |
| [brand-guidelines](https://github.com/divinevideo/brand-guidelines) | Brand DNA, tone of voice, and visual identity |

## How It Works

### Nostr Protocol

[Nostr](https://github.com/nostr-protocol/nostr) (Notes and Other Stuff Transmitted by Relays) is a simple, open protocol for decentralized social networking. Here's how Divine uses it:

- **Identity**: Users have a cryptographic keypair. Your public key is your identity, and you sign all your content with your private key. No email, no phone number, no company owns your account.

- **Content**: Videos are published as Nostr events (kind 34236) containing metadata and links to the actual video files. These events are signed and can be verified by anyone.

- **Social Graph**: Follows, likes, reposts, and comments are all Nostr events. Your social connections aren't locked into Divine — they work across the entire Nostr ecosystem.

- **Relays**: Content is stored on relays — servers that accept and serve Nostr events. You can use any relay, run your own, or use multiple for redundancy.

### Blossom (Media Storage)

[Blossom](https://github.com/hzrd149/blossom) is a protocol for decentralized media storage that complements Nostr. Since Nostr events are lightweight (just JSON), large files like videos are stored separately:

- Videos are uploaded to Blossom servers and addressed by their SHA-256 hash
- The hash is included in the Nostr event, linking the metadata to the media
- Multiple Blossom servers can host the same file, providing redundancy
- Anyone can verify file integrity by checking the hash

This separation keeps Nostr relays fast while enabling rich media content.

### C2PA Content Credentials

Divine integrates [C2PA](https://c2pa.org/) (Coalition for Content Provenance and Authenticity) to provide content provenance and authenticity verification. This helps users understand the origin of media and detect AI-generated or manipulated content.

### Keycast (Authentication & Signing)

[Keycast](https://github.com/divinevideo/keycast) provides OAuth 2.0 authentication with NIP-46 remote signing, allowing users to log in and sign Nostr events without exposing their private keys. It issues UCAN tokens for cross-service authorization.

## Contributing

We welcome contributions! Whether you're fixing bugs, adding features, or improving documentation, we'd love your help.

### Getting Started

1. **Find an issue** — Check the issues tab in any repository, or open a new one
2. **Fork & clone** — Fork the repo and clone it locally
3. **Create a branch** — Make your changes in a feature branch
4. **Submit a PR** — Open a pull request with a clear description

### Development Setup

**divine-web:**
```bash
git clone https://github.com/divinevideo/divine-web
cd divine-web
npm install
npm run dev
```

**divine-mobile:**
```bash
git clone https://github.com/divinevideo/divine-mobile
cd divine-mobile
flutter pub get
flutter run
```

**Rust services** (keycast, divine-funnelcake, divine-blossom, etc.):
```bash
git clone https://github.com/divinevideo/<repo-name>
cd <repo-name>
cargo build
```

### Community

- **Nostr**: Follow us on Nostr for updates

## License

All Divine repositories are open source. Check individual repositories for specific license information.

---

*Divine is part of the broader movement to build a more open, decentralized internet. We believe social media should be a protocol, not a platform.*
