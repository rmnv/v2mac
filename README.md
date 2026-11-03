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
  <a href="#build-from-source">Build</a>
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

## License

[GPL-3.0](LICENSE). See [NOTICE](NOTICE) for the fork and upstream attribution. Bundles [Xray-core](https://github.com/XTLS/Xray-core) (MPL-2.0); see [THIRD_PARTY.md](THIRD_PARTY.md).

<p align="center"><sub>If V2Mac helps you, a ⭐ helps others find it.</sub></p>
