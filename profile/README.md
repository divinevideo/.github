# Divine

**Short-form looping video on the decentralized web**

Divine is an open-source platform for sharing short looping videos on [Nostr](https://nostr.com) — social media as a protocol, not a walled garden.

## What We're Building

Divine brings back short-form looping video in a way that's:
- **Decentralized** — no single company owns your identity or social graph
- **Open Source** — core infrastructure and apps are developed in public
- **Interoperable** — identity/content travel across Nostr clients
- **Resilient** — protocol-native architecture with multiple services and relays

## Core Repositories

### Applications
- [divine-mobile](https://github.com/divinevideo/divine-mobile) — Flutter app (iOS/Android)
- [divine-web](https://github.com/divinevideo/divine-web) — React/TypeScript web app

### Identity, Discovery, and Routing
- [divine-name-server](https://github.com/divinevideo/divine-name-server) — name verification/lookup services
- [keycast](https://github.com/divinevideo/keycast) — account claim and key tooling
- [divine-router](https://github.com/divinevideo/divine-router) — routing/gateway components

### Media, Relay, and Infra Services
- [divine-blossom](https://github.com/divinevideo/divine-blossom) — media storage/relay stack
- [divine-funnelcake](https://github.com/divinevideo/divine-funnelcake) — relay/search backend
- [divine-relay-manager](https://github.com/divinevideo/divine-relay-manager) — relay operations and moderation controls
- [divine-rest-gateway](https://github.com/divinevideo/divine-rest-gateway) — API gateway services
- [divine-push-service](https://github.com/divinevideo/divine-push-service) — push notification pipeline

### Safety and Moderation
- [divine-moderation-service](https://github.com/divinevideo/divine-moderation-service)
- [divine-moderation-api](https://github.com/divinevideo/divine-moderation-api)
- [osprey](https://github.com/divinevideo/osprey) — trust & safety policy/rules work

## Note on Deprecated Repos

Some older repos remain for historical/reference reasons.

- [`divine-cdn-worker`](https://github.com/divinevideo/divine-cdn-worker) is deprecated and replaced by [`divine-blossom`](https://github.com/divinevideo/divine-blossom).

## How It Works (High-Level)

- **Identity**: users authenticate with cryptographic keys (Nostr-native)
- **Content**: metadata is published as Nostr events; media is stored in dedicated media services
- **Social Graph**: follows/likes/reposts/comments are protocol events, not locked to a single app
- **Relays and Services**: multiple components cooperate to provide performance, safety, and resilience

## Contributing

We welcome contributions across product, protocol, infrastructure, and docs.

- Check open issues in the relevant repository
- Fork, branch, and open a PR with clear context
- Follow each repo’s local CONTRIBUTING/CI requirements

## Community

- Discord: [divine.video/discord](https://divine.video/discord)

---

*Divine is building open social video on open protocols.*
