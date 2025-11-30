# diVine

**Short-form looping video on the decentralized web**

diVine is an open-source platform for sharing 6-second looping videos, built on [Nostr](https://nostr.com) - a decentralized social protocol. Think Vine, but nobody owns it and nobody can shut it down.

## What We're Building

diVine brings back the magic of short-form looping video in a way that's:
- **Decentralized** - No single company controls your content or social graph
- **Open Source** - All our code is public and contributions are welcome
- **Interoperable** - Your videos and followers work across any Nostr client
- **Censorship Resistant** - Content lives on multiple relays, not one server

## Architecture

### Frontend Applications

| Repository | Stack | Description |
|------------|-------|-------------|
| [divine-web](https://github.com/divinevideo/divine-web) | React + TypeScript + Vite | Web application at [divine.video](https://divine.video) |
| [divine-mobile](https://github.com/divinevideo/divine-mobile) | Flutter | Native iOS and Android apps |

### Backend Services

| Repository | Description |
|------------|-------------|
| [divine-relay](https://github.com/divinevideo/divine-relay) | Nostr relay optimized for video content |
| [divine-moderation-service](https://github.com/divinevideo/divine-moderation-service) | Content moderation and safety tools |
| [divine-cdn-worker](https://github.com/divinevideo/divine-cdn-worker) | Video transcoding and CDN integration |

## How It Works

### Nostr Protocol

[Nostr](https://github.com/nostr-protocol/nostr) (Notes and Other Stuff Transmitted by Relays) is a simple, open protocol for decentralized social networking. Here's how diVine uses it:

- **Identity**: Users have a cryptographic keypair. Your public key is your identity, and you sign all your content with your private key. No email, no phone number, no company owns your account.

- **Content**: Videos are published as Nostr events (kind 34236) containing metadata and links to the actual video files. These events are signed and can be verified by anyone.

- **Social Graph**: Follows, likes, reposts, and comments are all Nostr events. Your social connections aren't locked into diVine - they work across the entire Nostr ecosystem.

- **Relays**: Content is stored on relays - servers that accept and serve Nostr events. You can use any relay, run your own, or use multiple for redundancy.

### Blossom (Media Storage)

[Blossom](https://github.com/hzrd149/blossom) is a protocol for decentralized media storage that complements Nostr. Since Nostr events are lightweight (just JSON), large files like videos are stored separately:

- Videos are uploaded to Blossom servers and addressed by their SHA-256 hash
- The hash is included in the Nostr event, linking the metadata to the media
- Multiple Blossom servers can host the same file, providing redundancy
- Anyone can verify file integrity by checking the hash

This separation keeps Nostr relays fast while enabling rich media content.

## Contributing

We welcome contributions! Whether you're fixing bugs, adding features, or improving documentation, we'd love your help.

### Getting Started

1. **Find an issue** - Check the issues tab in any repository, or open a new one
2. **Fork & clone** - Fork the repo and clone it locally
3. **Create a branch** - Make your changes in a feature branch
4. **Submit a PR** - Open a pull request with a clear description

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

### Community

- **Discord**: [Join our Discord](https://divine.video/discord)
- **Nostr**: Follow us on Nostr for updates

## License

All diVine repositories are open source. Check individual repositories for specific license information.

---

*diVine is part of the broader movement to build a more open, decentralized internet. We believe social media should be a protocol, not a platform.*
