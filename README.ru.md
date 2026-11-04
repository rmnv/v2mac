<p align="center"><img src="docs/images/banner.jpg" alt="V2Mac — нативный клиент Xray-core для macOS с поддержкой VLESS, VMess, Trojan, Shadowsocks и Hysteria2" width="720"></p>

<h1 align="center">V2Mac</h1>

<p align="center"><b>Нативный клиент Xray-core и V2Ray для macOS.</b><br>
VLESS, REALITY, VMess, Trojan, Shadowsocks, Hysteria2 и WireGuard в быстром приложении для строки меню на SwiftUI для Apple Silicon.</p>

<p align="center">
  <a href="https://github.com/rmnv/v2mac/releases/latest"><img src="https://img.shields.io/github/v/release/rmnv/v2mac?label=release&color=0A84FF" alt="Последний релиз"></a>
  <a href="https://github.com/rmnv/v2mac/releases"><img src="https://img.shields.io/github/downloads/rmnv/v2mac/total?color=34C759" alt="Загрузки"></a>
  <a href="https://github.com/rmnv/v2mac/actions/workflows/ci.yml"><img src="https://img.shields.io/github/actions/workflow/status/rmnv/v2mac/ci.yml?branch=main&label=CI" alt="Статус CI"></a>
  <img src="https://img.shields.io/badge/macOS-15%2B-000000?logo=apple" alt="macOS 15 или новее">
  <img src="https://img.shields.io/badge/Apple%20Silicon-arm64-555555" alt="Apple Silicon">
  <img src="https://img.shields.io/badge/Swift-6-F05138?logo=swift&logoColor=white" alt="Swift 6">
  <a href="LICENSE"><img src="https://img.shields.io/github/license/rmnv/v2mac?color=blue" alt="Лицензия GPL-3.0"></a>
  <a href="https://github.com/rmnv/v2mac/stargazers"><img src="https://img.shields.io/github/stars/rmnv/v2mac?style=flat&color=FFCC00" alt="Звёзды на GitHub"></a>
</p>

<p align="center"><a href="README.md">English</a> | <a href="README.fa.md">فارسی</a> | <a href="README.zh.md">简体中文</a> | Русский</p>

<p align="center">
  <a href="#установка">Установка</a> ·
  <a href="#возможности">Возможности</a> ·
  <a href="https://github.com/rmnv/v2mac"><b>GitHub</b></a> ·
  <a href="#сборка-из-исходников">Сборка</a> ·
  <a href="#публикация-форка">Публикация</a>
</p>

<p align="center"><img src="docs/images/screenshots/server-browsing.gif" alt="Главное окно V2Mac: сортировка серверов по задержке, избранное и поиск" width="760"></p>

Вставьте ссылку подписки, выберите сервер — и у вас локальный прокси SOCKS5 + HTTP; или включите режим TUN, чтобы через него шёл весь Mac. V2Mac — бесплатная **альтернатива v2rayN / V2RayX для macOS** с открытым кодом, написанная нативно на SwiftUI. Без Electron, без аналитики, без телеметрии.

## Отличия от оригинального V2Mac

Этот форк сохраняет работоспособность V2Mac на компьютерах Mac, которые не могут запустить оригинальную сборку для macOS 26.

Автор и мейнтейнер форка: **[Anton Romanov](https://github.com/rmnv)**.

| | Этот форк | Оригинальный V2Mac |
|---|---|---|
| Минимальная система | macOS 15 | macOS 26 |
| Инструменты сборки | Xcode 16.4, Swift 6.1 | Xcode 26+, Swift 6.2 |
| Интерфейс | Стандартные материалы и элементы SwiftUI | Liquid Glass |
| Ограничения устройств провайдера | По умолчанию отправляет редактируемый `x-hwid` и данные macOS | Настройки HWID нет |
| Переключатель в Пункте управления | Недоступен из-за отсутствия API в macOS 15 | Доступен |
| Подсказки доменов Apple Intelligence | Недоступны в macOS 15 | Доступны |

В остальном прокси-ядро, подписки, TUN, системный прокси, правила маршрутизации и форматы серверов соответствуют оригинальному V2Mac.

Что изменено в исходном коде этого форка:

- deployment target снижен до macOS 15, а проект адаптирован для сборки в Xcode 16.4 со Swift 6.1;
- интерфейсные API macOS 26 заменены совместимыми материалами и элементами SwiftUI;
- расширение Пункта управления и подсказки Apple Intelligence исключены из сборки, потому что нужных API нет в macOS 15;
- при обновлении подписки по умолчанию отправляются заголовки `x-hwid`, `x-device-os`, `x-ver-os` и `x-device-model` для провайдеров с привязкой устройства;
- HWID хранится локально, его можно отключить, изменить или сгенерировать заново в **Settings → Servers**;
- ссылки на обновления, Releases, Issues и сведения об авторе направлены на `rmnv/v2mac`;
- исходные bundle ID и каталог данных сохранены намеренно, чтобы существующие настройки, Keychain, helper и резервные копии оставались совместимыми.

## Установка

Нужна **macOS 15 или новее** на **Apple Silicon**.

Скачайте DMG из Releases этого форка. Homebrew cask и Releases оригинального проекта содержат сборку для macOS 26, а не этот совместимый форк. Приложение не нотаризовано: при первом запуске нажмите **Всё равно открыть** в Системные настройки → Конфиденциальность и безопасность.

**Быстрый старт:** нажмите **Add Subscription** и вставьте ссылку, дважды щёлкните сервер, затем используйте `127.0.0.1:10808` (SOCKS5 / HTTP) или включите **System Proxy** или **TUN**.

## Возможности

- **Протоколы:** VLESS (REALITY, XTLS Vision), VMess, Trojan, Shadowsocks, Hysteria2, WireGuard, SOCKS, HTTP и полные JSON-конфиги Xray.
- **Подписки:** автообновление, трафик и срок действия, избранное, импорт по QR и в один щелчок, полный редактор серверов.
- **Подключение:** тесты реальной задержки и скорости, автовыбор сервера, смена сервера без перезапуска, страна выхода в строке меню.
- **Весь Mac:** TUN, системный прокси и kill switch на основе pf.
- **Маршрутизация:** Global, Bypass regions (Иран, Китай, Россия), Rules Only и Direct, плюс правила Proxy / Direct / Block по сайтам и приложениям.
- **Замена Proxifier:** правила для приложений с условиями «Только когда», правила через другой сервер или группу, импорт профилей `.ppx` и живой список соединений.
- **Cloudflare WARP:** как отдельный сервер или в цепочке за вашим.
- **Безопасная песочница (бета):** приложения в мини-ВМ, у каждой свой сервер и без утечек при обрыве; каждое приложение — отдельное приложение Mac. Скачивается только при первом открытии.
- **macOS:** панель в строке меню, Команды, Siri, Spotlight, виджет на рабочем столе, Touch ID, уведомления, резервное копирование. Английский, персидский, китайский и русский.

## Скриншоты

<p align="center"><img src="docs/images/screenshots/main.png" alt="Главное окно V2Mac: группы подписок, задержка и скорость серверов, инспектор и панель подключения" width="760"></p>

<table>
  <tr>
    <td align="center"><img src="docs/images/screenshots/rule-editor-simple.png" alt="Правила" width="380"><br><sub>Правила для приложений и сайтов</sub></td>
    <td align="center"><img src="docs/images/screenshots/connections.png" alt="Окно Connections" width="380"><br><sub>Каждое соединение и его правило</sub></td>
  </tr>
  <tr>
    <td align="center"><img src="docs/images/screenshots/rule-builder-countries.png" alt="Карта стран" width="380"><br><sub>Страны на карте</sub></td>
    <td align="center"><img src="docs/images/screenshots/proxifier-import.png" alt="Импорт профиля Proxifier" width="380"><br><sub>Импорт из Proxifier</sub></td>
  </tr>
</table>

## Документация

**[Вики V2Mac](https://github.com/v2macapp/v2mac/wiki/ru-Home)** описывает всё подробно:

| | |
|---|---|
| [Установка](https://github.com/v2macapp/v2mac/wiki/ru-Installation) | Homebrew, DMG, первый запуск, обновления |
| [Серверы и подписки](https://github.com/v2macapp/v2mac/wiki/ru-Servers-and-Subscriptions) | Добавление, обновление, редактирование, тесты задержки |
| [Подключение](https://github.com/v2macapp/v2mac/wiki/ru-Connecting) | TUN, системный прокси, kill switch, проверка выхода, WARP |
| [Маршрутизация](https://github.com/v2macapp/v2mac/wiki/ru-Routing) | Режимы, окно «Правила», серверы Via, импорт из Proxifier |
| [Соединения](https://github.com/v2macapp/v2mac/wiki/ru-Connections) | Живой список соединений |
| [Безопасная песочница](https://github.com/v2macapp/v2mac/wiki/ru-Sandbox) | Мини-ВМ, приложения песочницы, выходы, магазин |
| [Строка меню и быстрые команды](https://github.com/v2macapp/v2mac/wiki/ru-Menu-Bar-and-Shortcuts) | Панель, клавиатура, Команды, уведомления |
| [Справочник настроек](https://github.com/v2macapp/v2mac/wiki/ru-Settings-Reference) | Все настройки, резервная копия, приватность |
| [Решение проблем и FAQ](https://github.com/v2macapp/v2mac/wiki/ru-Troubleshooting-and-FAQ) | Частые проблемы и вопросы |

## Сборка из исходников

```sh
Scripts/fetch-core.sh
xcodegen generate
xcodebuild -project v2mac.xcodeproj -scheme v2mac -configuration Debug build
```

Нужны Xcode 16.4 и [XcodeGen](https://github.com/yonaskolb/XcodeGen). Дизайн: [docs/SPEC.md](docs/SPEC.md). Тесты: `cd Packages/V2MacCore && swift test`. Сообщения об ошибках и pull request — в [Issues](https://github.com/rmnv/v2mac/issues).

## Публикация форка

### 1. Создание форка на GitHub

1. Войдите на GitHub под аккаунтом `rmnv`.
2. Откройте [`v2macapp/v2mac`](https://github.com/v2macapp/v2mac), нажмите **Fork**, выберите владельца `rmnv` и имя `v2mac`.
3. Убедитесь, что локальные remotes разделены: `origin` должен указывать на ваш форк, а `upstream` — на оригинал.

```sh
git remote -v

# Если remotes ещё не настроены:
git remote rename origin upstream
git remote add origin git@github.com:rmnv/v2mac.git
```

В этом рабочем каталоге remotes уже настроены, поэтому повторять две последние команды не нужно.

### 2. Публикация кода

Сначала опубликуйте рабочую ветку, затем обновите `main` форка тем же проверенным состоянием:

```sh
git push -u origin macos-15-support
git push origin macos-15-support:main
```

Команды не используют принудительную перезапись истории. Если GitHub отклонит обновление `main`, сначала получите изменения оригинала, объедините их и повторно запустите тесты:

```sh
git fetch upstream
git switch macos-15-support
git merge upstream/main
cd Packages/V2MacCore && swift test && cd ../..
```

После разрешения возможных конфликтов снова выполните обе команды `git push` выше. Не публикуйте ссылки подписок, токены провайдера, сертификаты и ключи подписи.

### 3. Сборка DMG

```sh
Scripts/make-dmg.sh
cd dist
shasum -a 256 -c V2Mac-0.1.0.dmg.sha256
cd ..
```

Без сертификата скрипт создаёт ad-hoc подписанную сборку: macOS потребует **Всё равно открыть**. Для публичного распространения лучше использовать Developer ID и notarization; скрипт поддерживает их через `SIGN_IDENTITY` и заранее созданный профиль `NOTARY_PROFILE`:

```sh
SIGN_IDENTITY="Developer ID Application: Your Name (TEAMID)" \
NOTARY_PROFILE="v2mac-notary" \
Scripts/make-dmg.sh
```

Не записывайте пароли или ключи в репозиторий — профиль notarization должен храниться в Keychain.

### 4. GitHub Release

Создайте отдельный тег форка и отправьте его на GitHub:

```sh
git tag -a v0.1.0-macos15 -m "V2Mac 0.1.0 for macOS 15"
git push origin v0.1.0-macos15
```

На странице **Releases → Draft a new release** выберите этот тег, приложите `dist/V2Mac-0.1.0.dmg` и `dist/V2Mac-0.1.0.dmg.sha256`, опишите отличия из раздела выше и опубликуйте релиз. При следующей версии сначала измените `MARKETING_VERSION` в `project.yml`, а затем используйте новый тег и соответствующее имя DMG.

Форк распространяется по GPL-3.0: оставляйте `LICENSE`, `NOTICE`, историю Git и доступ к исходному коду опубликованной версии.

## Лицензия

[GPL-3.0](LICENSE). Авторство форка и исходного проекта указано в [NOTICE](NOTICE). Включает [Xray-core](https://github.com/XTLS/Xray-core) (MPL-2.0); см. [THIRD_PARTY.md](THIRD_PARTY.md).

<p align="center"><sub>Если V2Mac вам помогает, ⭐ поможет другим его найти.</sub></p>
