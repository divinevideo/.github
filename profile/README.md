# diVine

**Welcome Home.**

diVine is bringing back the six-second videos that shaped internet culture — on a new protocol where creators own what they make and everyone has more say over their feeds. It's your playground for human creativity and connection, in all its weird, wonderful, technicolor glory.

We've brought 100,000+ Vines back to life from the original archives, and we're building the place where the next ones get made. No algorithms deciding what you see. No AI slop. Just quick bursts of real human creativity.

## What We Stand For

- **No slop. All human.** Our systems are designed to catch and remove machine-generated content, and our community flags what slips through. We might not catch it all, but we're committed to keeping diVine as human-only as possible.
- **Own what you make. Choose what you see.** diVine is built on [Nostr](https://nostr.com), a decentralized social protocol. Your identity, your content, and your followers are yours — they work across the whole Nostr ecosystem, not just our apps.
- **Joy scrolling > doom scrolling.** Feeds shaped by your curiosity, not an ad-driven black box. We're building "choose your experience" algorithms so your feed works for you.
- **Community-built.** Everything here is open source. We're a band of thoughtful rascals building this with and for the community — and we'd love your help.

## The Code

Everything below is open source and open to contributions.

### Apps

| Repository | Stack | Description |
|------------|-------|-------------|
| [divine-web](https://github.com/divinevideo/divine-web) | React + TypeScript + Vite | The diVine web app at [divine.video](https://divine.video) |
| [divine-mobile](https://github.com/divinevideo/divine-mobile) | Flutter | Native iOS and Android apps |
| [divine-space](https://github.com/divinevideo/divine-space) | React + TypeScript + Vite | MySpace-inspired video social network on Nostr |
| [divine-relay-manager](https://github.com/divinevideo/divine-relay-manager) | React + TypeScript + Vite | Nostr relay management dashboard |

### Core Services

| Repository | Stack | Description |
|------------|-------|-------------|
| [keycast](https://github.com/divinevideo/keycast) | Rust / Axum | OAuth 2.0 + NIP-46 remote signing + UCAN tokens ([login.divine.video](https://login.divine.video)) |
| [divine-login](https://github.com/divinevideo/divine-login) | TypeScript | OAuth client for Keycast authentication and Nostr signing |
| [divine-signer](https://github.com/divinevideo/divine-signer) | — | Nostr event signing service |
| [divine-blossom](https://github.com/divinevideo/divine-blossom) | Rust / Fastly Compute | Content-addressed media storage via the Blossom protocol ([media.divine.video](https://media.divine.video)) |
| [divine-upload-server](https://github.com/divinevideo/divine-upload-server) | — | Resumable upload data plane for diVine's Blossom storage |
| [divine-relay-sync](https://github.com/divinevideo/divine-relay-sync) | Rust | Sync Nostr events between relays using NIP-77 negentropy |
| [divine-push-service](https://github.com/divinevideo/divine-push-service) | — | Push notifications for the mobile app |
| [divine-badges](https://github.com/divinevideo/divine-badges) | Cloudflare Worker + D1 | Diviner of the Day/Week/Month — automated NIP-58 creator badges |
| [divine-crosposter](https://github.com/divinevideo/divine-crosposter) | Cloudflare Worker | Opt-in crossposting of diVine videos to other platforms |
| [divine-clips](https://github.com/divinevideo/divine-clips) | — | Clipping marketplace for distributing diVine videos across social platforms |

### Keeping It Human (Trust & Safety)

| Repository | Stack | Description |
|------------|-------|-------------|
| [divine-moderation-service](https://github.com/divinevideo/divine-moderation-service) | Cloudflare Worker | Human-in-the-loop content moderation — NSFW, violence, AI-generated, and deepfake detection |
| [divine-moderation-api](https://github.com/divinevideo/divine-moderation-api) | Cloudflare Worker | Public API for content moderation — queue producer + status checker |
| [divine-realness](https://github.com/divinevideo/divine-realness) | — | Multi-provider deepfake detection for Nostr video events |
| [osprey](https://github.com/divinevideo/osprey) | Rust | High-performance safety rules engine for real-time event processing |
| [coop](https://github.com/divinevideo/coop) | — | Online safety dashboard — queues, routing, and enforcement rules |
| [social-media-age-rules-db](https://github.com/divinevideo/social-media-age-rules-db) | — | Global social media age regulations database |

### Edge & Infrastructure

| Repository | Stack | Description |
|------------|-------|-------------|
| [divine-router](https://github.com/divinevideo/divine-router) | Rust / Fastly Compute | Edge router for divine.video subdomains |
| [divine-name-server](https://github.com/divinevideo/divine-name-server) | Cloudflare Worker | NIP-05 name server |
| [divine-name-sync](https://github.com/divinevideo/divine-name-sync) | — | NIP-05 name synchronization |
| [divine-rest-gateway](https://github.com/divinevideo/divine-rest-gateway) | Cloudflare Worker | REST API caching proxy for Nostr |
| [divine-identify-verification-service](https://github.com/divinevideo/divine-identify-verification-service) | Cloudflare Worker | Identity and verification service |
| [divine-sky](https://github.com/divinevideo/divine-sky) | — | diVine sky services |
| [divine-github-actions](https://github.com/divinevideo/divine-github-actions) | GitHub Actions | Reusable CI/CD workflows for diVine repositories |

### Libraries & SDKs

| Repository | Stack | Description |
|------------|-------|-------------|
| [keycast_flutter_demo](https://github.com/divinevideo/keycast_flutter_demo) | Flutter / Dart | Keycast Flutter library and demo app for OAuth + PKCE + BYOK Nostr signing |
| [c2pa-flutter](https://github.com/divinevideo/c2pa-flutter) | Flutter / Dart | Flutter wrapper for the official C2PA mobile SDKs |
| [c2pa-rs](https://github.com/divinevideo/c2pa-rs) | Rust | Fork of the C2PA Rust SDK for content provenance and authenticity |
| [media-kit](https://github.com/divinevideo/media-kit) | Flutter / Dart | Fork of the cross-platform video & audio player for Flutter |

### Brand

| Repository | Description |
|------------|-------------|
| [brand-guidelines](https://github.com/divinevideo/brand-guidelines) | diVine brand DNA, tone of voice, and visual identity |

## How It Works

### Nostr Protocol

[Nostr](https://github.com/nostr-protocol/nostr) (Notes and Other Stuff Transmitted by Relays) is a simple, open protocol for decentralized social networking. Here's how diVine uses it:

- **Identity**: You have a cryptographic keypair. Your public key is your identity, and you sign all your content with your private key. No email, no phone number, no company owns your account.

- **Content**: Videos are published as Nostr events (kind 34236) containing metadata and links to the actual video files. These events are signed and can be verified by anyone.

- **Social Graph**: Follows, likes, reposts, and comments are all Nostr events. Your social connections aren't locked into diVine — they work across the entire Nostr ecosystem.

- **Relays**: Content is stored on relays — servers that accept and serve Nostr events. You can use any relay, run your own, or use multiple for redundancy.

### Blossom (Media Storage)

[Blossom](https://github.com/hzrd149/blossom) is a protocol for decentralized media storage that complements Nostr. Since Nostr events are lightweight (just JSON), large files like videos are stored separately:

- Videos are uploaded to Blossom servers and addressed by their SHA-256 hash
- The hash is included in the Nostr event, linking the metadata to the media
- Multiple Blossom servers can host the same file, providing redundancy
- Anyone can verify file integrity by checking the hash

This separation keeps Nostr relays fast while enabling rich media content.

### C2PA Content Credentials

diVine integrates [C2PA](https://c2pa.org/) (Coalition for Content Provenance and Authenticity) to verify where media comes from — one of the tools we use to detect AI-generated and manipulated content and keep the playground human.

### Keycast (Authentication & Signing)

[Keycast](https://github.com/divinevideo/keycast) provides OAuth 2.0 authentication with NIP-46 remote signing, so you can log in and sign Nostr events without ever exposing your private keys. It issues UCAN tokens for cross-service authorization.

## Contributing

We're building this together, and we'd love your help — bug fixes, features, docs, or just telling us what's broken.

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

**Rust services** (keycast, divine-blossom, etc.):
```bash
git clone https://github.com/divinevideo/<repo-name>
cd <repo-name>
cargo build
```

### Community

- **Nostr**: Follow us on Nostr for updates
- **Web**: [divine.video](https://divine.video)

## License

All diVine repositories are open source. Check individual repositories for specific license information.

---

*Creative power belongs in human hands. diVine is part of the broader movement to build a more open, decentralized internet — we believe social media should be a protocol, not a platform.*
