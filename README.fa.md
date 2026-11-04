<p align="center"><img src="docs/images/banner.jpg" alt="V2Mac، کلاینت بومی Xray-core برای macOS با پشتیبانی از VLESS، VMess، Trojan، Shadowsocks و Hysteria2" width="720"></p>

<h1 align="center">V2Mac</h1>

<p align="center" dir="rtl"><b>کلاینت بومی macOS برای Xray-core و V2Ray.</b><br>
VLESS، REALITY، VMess، Trojan، Shadowsocks، Hysteria2 و WireGuard در یک برنامهٔ سریع منوبار با SwiftUI برای مک‌های Apple Silicon.</p>

<p align="center">
  <a href="https://github.com/rmnv/v2mac/releases/latest"><img src="https://img.shields.io/github/v/release/rmnv/v2mac?label=release&color=0A84FF" alt="آخرین نسخه"></a>
  <a href="https://github.com/rmnv/v2mac/releases"><img src="https://img.shields.io/github/downloads/rmnv/v2mac/total?color=34C759" alt="تعداد دانلود"></a>
  <a href="https://github.com/rmnv/v2mac/actions/workflows/ci.yml"><img src="https://img.shields.io/github/actions/workflow/status/rmnv/v2mac/ci.yml?branch=main&label=CI" alt="وضعیت CI"></a>
  <img src="https://img.shields.io/badge/macOS-15%2B-000000?logo=apple" alt="macOS 15 یا جدیدتر">
  <img src="https://img.shields.io/badge/Apple%20Silicon-arm64-555555" alt="Apple Silicon">
  <img src="https://img.shields.io/badge/Swift-6-F05138?logo=swift&logoColor=white" alt="Swift 6">
  <a href="LICENSE"><img src="https://img.shields.io/github/license/rmnv/v2mac?color=blue" alt="مجوز GPL-3.0"></a>
  <a href="https://github.com/rmnv/v2mac/stargazers"><img src="https://img.shields.io/github/stars/rmnv/v2mac?style=flat&color=FFCC00" alt="ستاره‌های گیت‌هاب"></a>
</p>

<p align="center"><a href="README.md">English</a> | فارسی | <a href="README.zh.md">简体中文</a> | <a href="README.ru.md">Русский</a></p>

<p align="center" dir="rtl">
  <a href="#نصب">نصب</a> ·
  <a href="#امکانات">امکانات</a> ·
  <a href="https://github.com/rmnv/v2mac"><b>GitHub</b></a> ·
  <a href="#ساخت-از-سورس">ساخت</a> ·
  <a href="#انتشار-فورک">انتشار</a>
</p>

<p align="center"><img src="docs/images/screenshots/server-browsing.gif" alt="پنجرهٔ اصلی V2Mac: مرتب‌سازی سرورها بر اساس تأخیر، باز کردن علاقه‌مندی‌ها و جستجو" width="760"></p>

<div dir="rtl">

لینک اشتراک را وارد کنید، یک سرور انتخاب کنید و یک پروکسی محلی SOCKS5 و HTTP تحویل بگیرید، یا حالت TUN را روشن کنید تا کل مک از آن عبور کند. V2Mac یک **جایگزین رایگان و متن‌باز v2rayN و V2RayX برای macOS** است که به‌صورت بومی با SwiftUI نوشته شده. بدون Electron، بدون آمارگیری و بدون ارسال داده.

## تفاوت با نسخهٔ اصلی

این فورک توسط **[Anton Romanov](https://github.com/rmnv)** نگهداری می‌شود و از macOS 15 و Xcode 16.4 پشتیبانی می‌کند. رابط از مواد استاندارد SwiftUI استفاده می‌کند و برای سرویس‌دهنده‌های دارای محدودیت دستگاه، `x-hwid` قابل‌ویرایش را به‌طور پیش‌فرض می‌فرستد. قابلیت‌های مخصوص macOS 26 مانند Liquid Glass، کنترل Control Center و پیشنهاد دامنهٔ Apple Intelligence در این فورک وجود ندارند.

تغییرات دقیق سورس در این فورک:

- deployment target به macOS 15 کاهش یافته و پروژه برای Xcode 16.4 و Swift 6.1 سازگار شده است؛
- APIهای رابط مخصوص macOS 26 با مواد و کنترل‌های سازگار SwiftUI جایگزین شده‌اند؛
- افزونهٔ Control Center و پیشنهادهای Apple Intelligence به دلیل نبود APIهای لازم در macOS 15 از ساخت حذف شده‌اند؛
- هنگام به‌روزرسانی اشتراک، هدرهای `x-hwid`، `x-device-os`، `x-ver-os` و `x-device-model` برای سرویس‌دهنده‌های دارای اتصال به دستگاه به‌طور پیش‌فرض ارسال می‌شوند؛
- HWID فقط به‌صورت محلی ذخیره می‌شود و در **Settings → Servers** می‌توان آن را غیرفعال، ویرایش یا دوباره تولید کرد؛
- لینک‌های به‌روزرسانی، Releases، Issues و نویسنده به `rmnv/v2mac` اشاره می‌کنند؛
- bundle IDها و پوشهٔ دادهٔ اصلی عمداً حفظ شده‌اند تا تنظیمات، Keychain، helper و نسخه‌های پشتیبان قبلی سازگار بمانند.

## نصب

به **macOS 15 یا جدیدتر** روی **Apple Silicon** نیاز دارد. DMG را از Releases همین فورک دریافت کنید؛ Homebrew cask نسخهٔ اصلی macOS 26 را نصب می‌کند.

</div>

<div dir="rtl">

**شروع سریع:** روی **Add Subscription** بزنید و لینک را بچسبانید، روی یک سرور دوبار کلیک کنید، سپس از `127.0.0.1:10808` (SOCKS5 / HTTP) استفاده کنید یا **System Proxy** یا **TUN** را روشن کنید.

## امکانات

- **پروتکل‌ها:** VLESS (REALITY، XTLS Vision)، VMess، Trojan، Shadowsocks، Hysteria2، WireGuard، SOCKS، HTTP و کانفیگ کامل JSON ایکس‌ری.
- **اشتراک‌ها:** به‌روزرسانی خودکار، حجم و تاریخ انقضا، علاقه‌مندی‌ها، وارد کردن با QR و یک کلیک، ویرایشگر کامل سرور.
- **اتصال:** تست تأخیر واقعی و سرعت، انتخاب خودکار سرور، تعویض زنده بدون ری‌استارت، کشور خروجی در نوار منو.
- **کل مک:** TUN، پراکسی سیستم و کیل‌سوییچ مبتنی بر pf.
- **مسیریابی:** Global، Bypass regions (ایران، چین، روسیه)، Rules Only و Direct، به‌همراه قوانین Proxy / Direct / Block بر اساس سایت و برنامه.
- **جایگزین Proxifier:** قانون برای هر برنامه با شرط‌های «فقط وقتی»، قانون از طریق سرور یا گروهی دیگر، وارد کردن پروفایل `.ppx` و نمای زندهٔ Connections.
- **Cloudflare WARP:** به‌عنوان سرور مستقل یا زنجیرشده پشت سرور شما.
- **سندباکس امن (بتا):** اجرای برنامه‌ها در ماشین‌های مجازی کوچک، هر کدام با سرور خودش و بدون نشت در صورت قطعی؛ هر برنامه مثل یک برنامهٔ جداگانهٔ مک. فقط با اولین باز کردن دانلود می‌شود.
- **macOS:** پنل نوار منو، Shortcuts، Siri، Spotlight، ویجت دسکتاپ، Touch ID، اعلان‌ها، پشتیبان‌گیری و بازگردانی. انگلیسی، فارسی، چینی و روسی.

## تصاویر برنامه

</div>

<p align="center"><img src="docs/images/screenshots/main.png" alt="پنجرهٔ اصلی V2Mac با گروه‌های اشتراک، تأخیر و سرعت سرورها، inspector و نوار اتصال" width="760"></p>

<table>
  <tr>
    <td align="center"><img src="docs/images/screenshots/rule-editor-simple.png" alt="قانون‌ها" width="380"><br><sub>قانون برای هر برنامه و سایت</sub></td>
    <td align="center"><img src="docs/images/screenshots/connections.png" alt="پنجرهٔ Connections" width="380"><br><sub>هر اتصال و قانون پشت آن</sub></td>
  </tr>
  <tr>
    <td align="center"><img src="docs/images/screenshots/rule-builder-countries.png" alt="نقشهٔ کشورها" width="380"><br><sub>انتخاب کشور روی نقشه</sub></td>
    <td align="center"><img src="docs/images/screenshots/proxifier-import.png" alt="وارد کردن پروفایل Proxifier" width="380"><br><sub>وارد کردن از Proxifier</sub></td>
  </tr>
</table>

<div dir="rtl">

## مستندات

**[ویکی V2Mac](https://github.com/v2macapp/v2mac/wiki/fa-Home)** همه چیز را با جزئیات توضیح می‌دهد:

| | |
|---|---|
| [نصب](https://github.com/v2macapp/v2mac/wiki/fa-Installation) | Homebrew، DMG، اولین اجرا، به‌روزرسانی |
| [سرورها و اشتراک‌ها](https://github.com/v2macapp/v2mac/wiki/fa-Servers-and-Subscriptions) | افزودن، به‌روزرسانی، ویرایش، تست تأخیر |
| [اتصال](https://github.com/v2macapp/v2mac/wiki/fa-Connecting) | TUN، پراکسی سیستم، کیل‌سوییچ، بررسی خروجی، WARP |
| [مسیریابی](https://github.com/v2macapp/v2mac/wiki/fa-Routing) | حالت‌ها، پنجرهٔ Rules، سرورهای Via، وارد کردن از Proxifier |
| [اتصال‌ها](https://github.com/v2macapp/v2mac/wiki/fa-Connections) | فهرست زندهٔ اتصال‌ها |
| [سندباکس امن](https://github.com/v2macapp/v2mac/wiki/fa-Sandbox) | ماشین‌های مجازی کوچک، برنامه‌های سندباکس، خروجی‌ها، فروشگاه |
| [نوار منو و میان‌برها](https://github.com/v2macapp/v2mac/wiki/fa-Menu-Bar-and-Shortcuts) | پنل، صفحه‌کلید، Shortcuts، اعلان‌ها |
| [مرجع تنظیمات](https://github.com/v2macapp/v2mac/wiki/fa-Settings-Reference) | همهٔ تنظیمات، پشتیبان‌گیری، حریم خصوصی |
| [عیب‌یابی و پرسش‌های رایج](https://github.com/v2macapp/v2mac/wiki/fa-Troubleshooting-and-FAQ) | مشکلات و پرسش‌های رایج |

## ساخت از سورس

</div>

```sh
Scripts/fetch-core.sh
xcodegen generate
xcodebuild -project v2mac.xcodeproj -scheme v2mac -configuration Debug build
```

<div dir="rtl">

به Xcode 16.4 و [XcodeGen](https://github.com/yonaskolb/XcodeGen) نیاز دارد. طراحی: [docs/SPEC.md](docs/SPEC.md). تست‌ها: `cd Packages/V2MacCore && swift test`. گزارش مشکل و pull request در [Issues](https://github.com/rmnv/v2mac/issues).

## انتشار فورک

### ۱. ساخت fork در GitHub

1. با حساب `rmnv` وارد GitHub شوید.
2. مخزن [`v2macapp/v2mac`](https://github.com/v2macapp/v2mac) را باز کنید، **Fork** را بزنید و `rmnv` را به‌عنوان مالک و `v2mac` را به‌عنوان نام انتخاب کنید.
3. بررسی کنید که `origin` به فورک شما و `upstream` به پروژهٔ اصلی اشاره کند.

</div>

```sh
git remote -v

# فقط اگر remoteها هنوز تنظیم نشده‌اند:
git remote rename origin upstream
git remote add origin git@github.com:rmnv/v2mac.git
```

<div dir="rtl">

در این پوشهٔ کاری remoteها از قبل تنظیم شده‌اند؛ دو دستور آخر را دوباره اجرا نکنید.

### ۲. انتشار کد

ابتدا شاخهٔ کاری و سپس همان commit آزمایش‌شده را در `main` فورک منتشر کنید:

</div>

```sh
git push -u origin macos-15-support
git push origin macos-15-support:main
```

<div dir="rtl">

این دستورها تاریخچه را اجباری بازنویسی نمی‌کنند. اگر GitHub به‌روزرسانی `main` را رد کرد، ابتدا upstream را ادغام و دوباره آزمایش کنید:

</div>

```sh
git fetch upstream
git switch macos-15-support
git merge upstream/main
cd Packages/V2MacCore && swift test && cd ../..
```

<div dir="rtl">

پس از حل conflictهای احتمالی، هر دو دستور `git push` را دوباره اجرا کنید. لینک اشتراک، توکن سرویس‌دهنده، گواهی امضا یا کلید خصوصی را منتشر نکنید.

### ۳. ساخت DMG

</div>

```sh
Scripts/make-dmg.sh
cd dist
shasum -a 256 -c V2Mac-0.1.0.dmg.sha256
cd ..
```

<div dir="rtl">

بدون گواهی، اسکریپت یک ساخت ad-hoc امضاشده می‌سازد و macOS گزینهٔ **Open Anyway** را درخواست می‌کند. برای انتشار عمومی بهتر است از Developer ID و notarization استفاده کنید؛ اسکریپت `SIGN_IDENTITY` و پروفایل از پیش ساخته‌شدهٔ `NOTARY_PROFILE` را می‌پذیرد:

</div>

```sh
SIGN_IDENTITY="Developer ID Application: Your Name (TEAMID)" \
NOTARY_PROFILE="v2mac-notary" \
Scripts/make-dmg.sh
```

<div dir="rtl">

رمز یا کلید را در مخزن ذخیره نکنید؛ پروفایل notarization باید در Keychain باشد.

### ۴. ساخت GitHub Release

یک tag مخصوص فورک بسازید و ارسال کنید:

</div>

```sh
git tag -a v0.1.0-macos15 -m "V2Mac 0.1.0 for macOS 15"
git push origin v0.1.0-macos15
```

<div dir="rtl">

در **Releases → Draft a new release** این tag را انتخاب کنید، فایل‌های `dist/V2Mac-0.1.0.dmg` و `dist/V2Mac-0.1.0.dmg.sha256` را پیوست کنید، تفاوت‌های بالا را بنویسید و release را منتشر کنید. برای نسخهٔ بعد، ابتدا `MARKETING_VERSION` را در `project.yml` تغییر دهید و سپس tag و نام DMG جدید را به‌کار ببرید.

این فورک تحت GPL-3.0 باقی می‌ماند؛ `LICENSE`، `NOTICE`، تاریخچهٔ Git و دسترسی به سورس هر فایل باینری منتشرشده را حفظ کنید.

## مجوز

[GPL-3.0](LICENSE). نام پدیدآورندگان فورک و پروژهٔ اصلی در [NOTICE](NOTICE) آمده است. شامل [Xray-core](https://github.com/XTLS/Xray-core) (MPL-2.0)؛ [THIRD_PARTY.md](THIRD_PARTY.md) را ببینید.

</div>

<p align="center"><sub>اگر V2Mac به کارتان آمد، یک ⭐ کمک می‌کند دیگران هم پیدایش کنند.</sub></p>
