<p align="center"><img src="docs/images/banner.jpg" alt="V2Mac, a native macOS Xray-core client for VLESS, VMess, Trojan, Shadowsocks and Hysteria2" width="720"></p>

<h1 align="center">V2Mac</h1>

<p align="center"><b>A native macOS client for Xray-core and V2Ray.</b><br>
VLESS, REALITY, VMess, Trojan, Shadowsocks, Hysteria2 and WireGuard in a fast SwiftUI menu bar app for Apple Silicon.</p>

<p align="center">
  <a href="https://github.com/rmnv/v2mac/releases/latest"><img src="https://img.shields.io/github/v/release/rmnv/v2mac?label=release&color=0A84FF" alt="Latest release"></a>
  <a href="https://github.com/rmnv/v2mac/releases"><img src="https://img.shields.io/github/downloads/rmnv/v2mac/total?color=34C759" alt="Total downloads"></a>
  <a href="https://github.com/rmnv/v2mac/actions/workflows/ci.yml"><img src="https://img.shields.io/github/actions/workflow/status/rmnv/v2mac/ci.yml?branch=main&label=CI" alt="CI status"></a>
  <img src="https://img.shields.io/badge/macOS-15%2B-000000?logo=apple" alt="macOS 15 or later">
  <img src="https://img.shields.io/badge/Apple%20Silicon-arm64-555555" alt="Apple Silicon">
  <img src="https://img.shields.io/badge/Swift-6-F05138?logo=swift&logoColor=white" alt="Swift 6">
  <a href="LICENSE"><img src="https://img.shields.io/github/license/rmnv/v2mac?color=blue" alt="GPL-3.0 license"></a>
  <a href="https://github.com/rmnv/v2mac/stargazers"><img src="https://img.shields.io/github/stars/rmnv/v2mac?style=flat&color=FFCC00" alt="GitHub stars"></a>
</p>

<p align="center">English | <a href="README.fa.md">فارسی</a> | <a href="README.zh.md">简体中文</a> | <a href="README.ru.md">Русский</a></p>

<p align="center">
  <a href="#install">Install</a> ·
  <a href="#features">Features</a> ·
  <a href="https://github.com/rmnv/v2mac"><b>GitHub</b></a> ·
  <a href="#build-from-source">Build</a> ·
  <a href="#publishing-the-fork">Publish</a>
</p>

<p align="center"><img src="docs/images/screenshots/server-browsing.gif" alt="V2Mac main window: sorting servers by delay, opening Favorites and searching" width="760"></p>

Paste a subscription link, pick a server, and you have a local SOCKS5 + HTTP proxy, or turn on TUN mode to send the whole Mac through it. V2Mac is a free, open-source **v2rayN / V2RayX alternative for macOS**, written natively in SwiftUI. No Electron, no analytics, no telemetry.

## Differences from upstream

This fork keeps V2Mac usable on current Macs that cannot run the upstream macOS 26 build.

Fork author and maintainer: **[Anton Romanov](https://github.com/rmnv)**.

| | This fork | Upstream V2Mac |
|---|---|---|
| Minimum system | macOS 15 | macOS 26 |
| Build tools | Xcode 16.4, Swift 6.1 | Xcode 26+, Swift 6.2 |
| Interface | Standard SwiftUI materials and controls | Liquid Glass |
| Provider device limits | Sends an editable `x-hwid` and macOS device metadata by default | No HWID setting |
| Control Center switch | Unavailable because its API is absent from macOS 15 | Available |
| Apple Intelligence domain suggestions | Unavailable on macOS 15 | Available |

Apart from these compatibility changes, the proxy core, subscriptions, TUN, system proxy, routing rules and server formats follow upstream V2Mac.

The source changes in this fork are:

- the deployment target is macOS 15, with the project adapted for Xcode 16.4 and Swift 6.1;
- macOS 26-only interface APIs are replaced with compatible SwiftUI materials and controls;
- the Control Center extension and Apple Intelligence suggestions are excluded because their APIs are unavailable on macOS 15;
- subscription updates send `x-hwid`, `x-device-os`, `x-ver-os` and `x-device-model` by default for providers that bind subscriptions to a device;
- the HWID is stored locally and can be disabled, edited or regenerated in **Settings → Servers**;
- update, Release, Issues and author links point to `rmnv/v2mac`;
- the original bundle IDs and data directory are intentionally retained so existing settings, Keychain entries, helper installation and backups remain compatible.

## Install

Requires **macOS 15 or later** on **Apple Silicon**.

Download the DMG from this fork's Releases. The upstream Homebrew cask and upstream Releases contain the macOS 26 build, not this compatibility fork. The app is not notarized: on first launch use **Open Anyway** in System Settings → Privacy & Security.

**Quick start:** click **Add Subscription** and paste your link, double-click a server, then use `127.0.0.1:10808` (SOCKS5 / HTTP) or switch on **System Proxy** or **TUN**.

## Features

- **Protocols:** VLESS (REALITY, XTLS Vision), VMess, Trojan, Shadowsocks, Hysteria2, WireGuard, SOCKS, HTTP and full Xray JSON configs.
- **Subscriptions:** auto-update, usage and expiry, favorites, QR and one-click import, a full server editor.
- **Connection:** real-delay and speed tests, automatic server selection, live switching without a restart, exit country in the menu bar.
- **Whole-Mac modes:** TUN, system proxy and a pf-based kill switch.
- **Routing:** Global, Bypass regions (Iran, China, Russia), Rules Only and Direct, plus Proxy / Direct / Block rules by site and by app.
- **Proxifier alternative:** per-app rules with "Only when" conditions, rules via another server or group, `.ppx` profile import and a live Connections view.
- **Cloudflare WARP:** as its own server or chained behind yours.
- **Secure Sandbox (beta):** run apps in mini VMs, each with its own server and fail-closed, every app as its own Mac app. Downloaded only when you first open it.
- **macOS:** menu bar panel, Shortcuts, Siri, Spotlight, a desktop widget, Touch ID, notifications, backup and restore. English, Persian, Chinese and Russian.

## Screenshots

<p align="center"><img src="docs/images/screenshots/main.png" alt="V2Mac main window with subscription groups, server delay and speed, inspector and connection bar" width="760"></p>

<table>
  <tr>
    <td align="center"><img src="docs/images/screenshots/rule-editor-simple.png" alt="Rules" width="380"><br><sub>Per-app and per-site rules</sub></td>
    <td align="center"><img src="docs/images/screenshots/connections.png" alt="Connections window" width="380"><br><sub>Every connection and the rule behind it</sub></td>
  </tr>
  <tr>
    <td align="center"><img src="docs/images/screenshots/rule-builder-countries.png" alt="Country map" width="380"><br><sub>Countries on the map</sub></td>
    <td align="center"><img src="docs/images/screenshots/proxifier-import.png" alt="Proxifier profile import" width="380"><br><sub>Proxifier import</sub></td>
  </tr>
</table>

## Documentation

The **[V2Mac Wiki](https://github.com/v2macapp/v2mac/wiki)** covers everything in detail:

| | |
|---|---|
| [Installation](https://github.com/v2macapp/v2mac/wiki/Installation) | Homebrew, DMG, first launch, updates |
| [Servers and Subscriptions](https://github.com/v2macapp/v2mac/wiki/Servers-and-Subscriptions) | Adding, updating, editing, latency tests |
| [Connecting](https://github.com/v2macapp/v2mac/wiki/Connecting) | TUN, system proxy, kill switch, exit check, WARP |
| [Routing](https://github.com/v2macapp/v2mac/wiki/Routing) | Modes, the Rules window, Via servers, Proxifier import |
| [Connections](https://github.com/v2macapp/v2mac/wiki/Connections) | Live connection list |
| [Secure Sandbox](https://github.com/v2macapp/v2mac/wiki/Sandbox) | Mini VMs, sandbox apps, exits, store |
| [Menu Bar and Shortcuts](https://github.com/v2macapp/v2mac/wiki/Menu-Bar-and-Shortcuts) | Panel, keyboard, Shortcuts, notifications |
| [Settings Reference](https://github.com/v2macapp/v2mac/wiki/Settings-Reference) | Every setting, backup, privacy |
| [Troubleshooting and FAQ](https://github.com/v2macapp/v2mac/wiki/Troubleshooting-and-FAQ) | Common problems and questions |

## Build from source

```sh
Scripts/fetch-core.sh
xcodegen generate
xcodebuild -project v2mac.xcodeproj -scheme v2mac -configuration Debug build
```

Needs Xcode 16.4 and [XcodeGen](https://github.com/yonaskolb/XcodeGen). Design: [docs/SPEC.md](docs/SPEC.md). Tests: `cd Packages/V2MacCore && swift test`. Bug reports and pull requests are welcome in [Issues](https://github.com/rmnv/v2mac/issues).

## Publishing the fork

### 1. Create the GitHub fork

1. Sign in to GitHub as `rmnv`.
2. Open [`v2macapp/v2mac`](https://github.com/v2macapp/v2mac), click **Fork**, and select `rmnv` as the owner and `v2mac` as the repository name.
3. Verify that local remotes are separated: `origin` must point to your fork and `upstream` to the original project.

```sh
git remote -v

# Run only if the remotes have not been configured yet:
git remote rename origin upstream
git remote add origin git@github.com:rmnv/v2mac.git
```

The remotes are already configured in this working copy, so the final two commands do not need to be repeated here.

### 2. Publish the code

Push the working branch first, then update the fork's `main` with the same tested commit:

```sh
git push -u origin macos-15-support
git push origin macos-15-support:main
```

These commands do not force-rewrite history. If GitHub rejects the `main` update, fetch and merge upstream before testing again:

```sh
git fetch upstream
git switch macos-15-support
git merge upstream/main
cd Packages/V2MacCore && swift test && cd ../..
```

Resolve any conflicts and repeat both `git push` commands. Never publish subscription URLs, provider tokens, signing certificates or private keys.

### 3. Build the DMG

```sh
Scripts/make-dmg.sh
cd dist
shasum -a 256 -c V2Mac-0.1.0.dmg.sha256
cd ..
```

Without a certificate the script creates an ad-hoc signed build, so macOS will require **Open Anyway**. For public distribution, Developer ID signing and notarization are preferable. The script accepts `SIGN_IDENTITY` and a previously created `NOTARY_PROFILE`:

```sh
SIGN_IDENTITY="Developer ID Application: Your Name (TEAMID)" \
NOTARY_PROFILE="v2mac-notary" \
Scripts/make-dmg.sh
```

Do not store passwords or keys in the repository; the notarization profile belongs in Keychain.

### 4. Create a GitHub Release

Create a fork-specific tag and push it:

```sh
git tag -a v0.1.0-macos15 -m "V2Mac 0.1.0 for macOS 15"
git push origin v0.1.0-macos15
```

On **Releases → Draft a new release**, choose the tag, attach `dist/V2Mac-0.1.0.dmg` and `dist/V2Mac-0.1.0.dmg.sha256`, summarize the differences listed above, and publish. For the next release, first change `MARKETING_VERSION` in `project.yml`, then use a new tag and the matching DMG name.

This fork remains GPL-3.0 software: retain `LICENSE`, `NOTICE`, Git history and access to the source used for every published binary.

## License

[GPL-3.0](LICENSE). See [NOTICE](NOTICE) for the fork and upstream attribution. Bundles [Xray-core](https://github.com/XTLS/Xray-core) (MPL-2.0); see [THIRD_PARTY.md](THIRD_PARTY.md).

<p align="center"><sub>If V2Mac helps you, a ⭐ helps others find it.</sub></p>
