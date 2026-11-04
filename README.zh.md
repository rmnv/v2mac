<p align="center"><img src="docs/images/banner.jpg" alt="V2Mac，原生 macOS Xray-core 客户端，支持 VLESS、VMess、Trojan、Shadowsocks 和 Hysteria2" width="720"></p>

<h1 align="center">V2Mac</h1>

<p align="center"><b>原生 macOS Xray-core / V2Ray 客户端。</b><br>
VLESS、REALITY、VMess、Trojan、Shadowsocks、Hysteria2 和 WireGuard，集成在一个为 Apple Silicon 打造的快速 SwiftUI 菜单栏应用中。</p>

<p align="center">
  <a href="https://github.com/rmnv/v2mac/releases/latest"><img src="https://img.shields.io/github/v/release/rmnv/v2mac?label=release&color=0A84FF" alt="最新版本"></a>
  <a href="https://github.com/rmnv/v2mac/releases"><img src="https://img.shields.io/github/downloads/rmnv/v2mac/total?color=34C759" alt="下载量"></a>
  <a href="https://github.com/rmnv/v2mac/actions/workflows/ci.yml"><img src="https://img.shields.io/github/actions/workflow/status/rmnv/v2mac/ci.yml?branch=main&label=CI" alt="CI 状态"></a>
  <img src="https://img.shields.io/badge/macOS-15%2B-000000?logo=apple" alt="macOS 15 或更高">
  <img src="https://img.shields.io/badge/Apple%20Silicon-arm64-555555" alt="Apple Silicon">
  <img src="https://img.shields.io/badge/Swift-6-F05138?logo=swift&logoColor=white" alt="Swift 6">
  <a href="LICENSE"><img src="https://img.shields.io/github/license/rmnv/v2mac?color=blue" alt="GPL-3.0 许可证"></a>
  <a href="https://github.com/rmnv/v2mac/stargazers"><img src="https://img.shields.io/github/stars/rmnv/v2mac?style=flat&color=FFCC00" alt="GitHub 星标"></a>
</p>

<p align="center"><a href="README.md">English</a> | <a href="README.fa.md">فارسی</a> | 简体中文 | <a href="README.ru.md">Русский</a></p>

<p align="center">
  <a href="#安装">安装</a> ·
  <a href="#功能">功能</a> ·
  <a href="https://github.com/rmnv/v2mac"><b>GitHub</b></a> ·
  <a href="#从源码构建">构建</a> ·
  <a href="#发布此分支">发布</a>
</p>

<p align="center"><img src="docs/images/screenshots/server-browsing.gif" alt="V2Mac 主窗口：按延迟排序服务器、打开收藏并搜索" width="760"></p>

粘贴订阅链接、选择服务器，即可获得本地 SOCKS5 + HTTP 代理；或打开 TUN 模式让整台 Mac 走代理。V2Mac 是免费开源的 **macOS 版 v2rayN / V2RayX 替代品**，使用 SwiftUI 原生编写。无 Electron、无统计分析、无遥测。

## 与上游版本的区别

此分支由 **[Anton Romanov](https://github.com/rmnv)** 维护，支持 macOS 15 和 Xcode 16.4，使用标准 SwiftUI 材质，并默认向需要设备限制的服务商发送可编辑的 `x-hwid`。上游版本要求 macOS 26，并包含 Liquid Glass、控制中心开关和 Apple Intelligence 域名建议；这些 macOS 26 功能在此分支中不可用。

此分支的具体源码变更：

- deployment target 降至 macOS 15，并适配 Xcode 16.4 和 Swift 6.1；
- macOS 26 专用界面 API 替换为兼容的 SwiftUI 材质和控件；
- 控制中心扩展和 Apple Intelligence 建议不参与构建，因为 macOS 15 没有相应 API；
- 更新订阅时默认发送 `x-hwid`、`x-device-os`、`x-ver-os` 和 `x-device-model`，以支持绑定设备的服务商；
- HWID 仅保存在本机，可在 **Settings → Servers** 中关闭、编辑或重新生成；
- 更新、Releases、Issues 和作者链接均指向 `rmnv/v2mac`；
- 原有 bundle ID 和数据目录被特意保留，以兼容现有设置、Keychain、helper 和备份。

## 安装

需要 **Apple Silicon** 上的 **macOS 15 或更高版本**。请从此分支的 Releases 下载 DMG；上游 Homebrew cask 安装的是 macOS 26 版本。

**快速开始：** 点击 **Add Subscription** 粘贴链接，双击服务器，然后使用 `127.0.0.1:10808`（SOCKS5 / HTTP），或打开 **System Proxy** 或 **TUN**。

## 功能

- **协议：** VLESS（REALITY、XTLS Vision）、VMess、Trojan、Shadowsocks、Hysteria2、WireGuard、SOCKS、HTTP 以及完整 Xray JSON 配置。
- **订阅：** 自动更新、流量与到期日、收藏、二维码和一键导入、完整的服务器编辑器。
- **连接：** 真实延迟和速度测试、自动选择服务器、无需重启的实时切换、菜单栏显示出口国家。
- **全局模式：** TUN、系统代理和基于 pf 的 Kill Switch。
- **路由：** Global、Bypass regions（伊朗、中国、俄罗斯）、Rules Only 和 Direct，以及按网站和应用的 Proxy / Direct / Block 规则。
- **Proxifier 替代品：** 按应用分流并支持“仅当”条件、经由其他服务器或分组的规则、导入 `.ppx` 配置和实时连接视图。
- **Cloudflare WARP：** 作为独立服务器或串接在你的服务器之后。
- **安全沙盒（测试版）：** 在迷你虚拟机中运行应用，每个虚拟机使用自己的服务器，断线即断网，每个应用都是独立的 Mac 应用。仅在首次打开时下载。
- **macOS 集成：** 菜单栏面板、快捷指令、Siri、Spotlight、桌面小组件、Touch ID、通知、备份与恢复。支持英语、波斯语、中文和俄语。

## 截图

<p align="center"><img src="docs/images/screenshots/main.png" alt="V2Mac 主窗口：订阅分组、服务器延迟和速度、检查器和连接栏" width="760"></p>

<table>
  <tr>
    <td align="center"><img src="docs/images/screenshots/rule-editor-simple.png" alt="规则" width="380"><br><sub>按应用和网站分流</sub></td>
    <td align="center"><img src="docs/images/screenshots/connections.png" alt="连接窗口" width="380"><br><sub>每个连接及其规则</sub></td>
  </tr>
  <tr>
    <td align="center"><img src="docs/images/screenshots/rule-builder-countries.png" alt="国家地图" width="380"><br><sub>在地图上选择国家</sub></td>
    <td align="center"><img src="docs/images/screenshots/proxifier-import.png" alt="导入 Proxifier 配置" width="380"><br><sub>导入 Proxifier</sub></td>
  </tr>
</table>

## 文档

**[V2Mac Wiki](https://github.com/v2macapp/v2mac/wiki/zh-Home)** 详细介绍了所有内容：

| | |
|---|---|
| [安装](https://github.com/v2macapp/v2mac/wiki/zh-Installation) | Homebrew、DMG、首次启动、更新 |
| [服务器与订阅](https://github.com/v2macapp/v2mac/wiki/zh-Servers-and-Subscriptions) | 添加、更新、编辑、延迟测试 |
| [连接](https://github.com/v2macapp/v2mac/wiki/zh-Connecting) | TUN、系统代理、Kill Switch、出口检测、WARP |
| [路由](https://github.com/v2macapp/v2mac/wiki/zh-Routing) | 模式、规则窗口、Via 服务器、导入 Proxifier |
| [连接列表](https://github.com/v2macapp/v2mac/wiki/zh-Connections) | 实时连接列表 |
| [安全沙盒](https://github.com/v2macapp/v2mac/wiki/zh-Sandbox) | 迷你虚拟机、沙盒应用、出口、商店 |
| [菜单栏与快捷方式](https://github.com/v2macapp/v2mac/wiki/zh-Menu-Bar-and-Shortcuts) | 面板、键盘、快捷指令、通知 |
| [设置参考](https://github.com/v2macapp/v2mac/wiki/zh-Settings-Reference) | 所有设置、备份、隐私 |
| [故障排除与常见问题](https://github.com/v2macapp/v2mac/wiki/zh-Troubleshooting-and-FAQ) | 常见问题与解答 |

## 从源码构建

```sh
Scripts/fetch-core.sh
xcodegen generate
xcodebuild -project v2mac.xcodeproj -scheme v2mac -configuration Debug build
```

需要 Xcode 16.4 和 [XcodeGen](https://github.com/yonaskolb/XcodeGen)。设计文档：[docs/SPEC.md](docs/SPEC.md)。测试：`cd Packages/V2MacCore && swift test`。欢迎在 [Issues](https://github.com/rmnv/v2mac/issues) 提交问题和 PR。

## 发布此分支

### 1. 创建 GitHub fork

1. 使用 `rmnv` 登录 GitHub。
2. 打开 [`v2macapp/v2mac`](https://github.com/v2macapp/v2mac)，点击 **Fork**，所有者选择 `rmnv`，仓库名填写 `v2mac`。
3. 确认 `origin` 指向你的 fork，`upstream` 指向原项目。

```sh
git remote -v

# 仅在尚未配置 remote 时执行：
git remote rename origin upstream
git remote add origin git@github.com:rmnv/v2mac.git
```

本工作目录已完成 remote 配置，无需重复最后两条命令。

### 2. 发布代码

先推送工作分支，再用同一已测试提交更新 fork 的 `main`：

```sh
git push -u origin macos-15-support
git push origin macos-15-support:main
```

以上命令不会强制改写历史。如果 GitHub 拒绝更新 `main`，请先合并上游并重新测试：

```sh
git fetch upstream
git switch macos-15-support
git merge upstream/main
cd Packages/V2MacCore && swift test && cd ../..
```

解决可能的冲突后，重新执行两条 `git push`。不要提交订阅链接、服务商令牌、签名证书或私钥。

### 3. 构建 DMG

```sh
Scripts/make-dmg.sh
cd dist
shasum -a 256 -c V2Mac-0.1.0.dmg.sha256
cd ..
```

没有证书时，脚本会创建 ad-hoc 签名的构建，macOS 会要求选择 **仍要打开**。公开分发时建议使用 Developer ID 签名和 notarization；脚本接受 `SIGN_IDENTITY` 和预先创建的 `NOTARY_PROFILE`：

```sh
SIGN_IDENTITY="Developer ID Application: Your Name (TEAMID)" \
NOTARY_PROFILE="v2mac-notary" \
Scripts/make-dmg.sh
```

不要把密码或密钥存入仓库；notarization profile 应保存在 Keychain 中。

### 4. 创建 GitHub Release

创建此分支专用的标签并推送：

```sh
git tag -a v0.1.0-macos15 -m "V2Mac 0.1.0 for macOS 15"
git push origin v0.1.0-macos15
```

在 **Releases → Draft a new release** 中选择该标签，上传 `dist/V2Mac-0.1.0.dmg` 和 `dist/V2Mac-0.1.0.dmg.sha256`，说明上述差异后发布。下次发布前，先修改 `project.yml` 中的 `MARKETING_VERSION`，再使用新标签和对应的 DMG 文件名。

此分支仍采用 GPL-3.0：请保留 `LICENSE`、`NOTICE`、Git 历史，并公开每个二进制版本对应的源码。

## 许可证

[GPL-3.0](LICENSE)。分支及上游署名见 [NOTICE](NOTICE)。内置 [Xray-core](https://github.com/XTLS/Xray-core)（MPL-2.0）；见 [THIRD_PARTY.md](THIRD_PARTY.md)。

<p align="center"><sub>如果 V2Mac 对你有帮助，点个 ⭐ 能让更多人发现它。</sub></p>
