[![KOReader](https://raw.githubusercontent.com/koreader/koreader.github.io/master/koreader-logo.png)](https://koreader.rocks)

> ## iOS / iPadOS — personal fork
>
> This repository is a fork of **[hezi/koreader-ios](https://github.com/hezi/koreader-ios)**,
> the iOS / iPadOS port of [koreader/koreader](https://github.com/koreader/koreader).
> It tracks that port and layers a few personal tweaks on top — see
> [**What this fork changes**](#what-this-fork-changes) below.
>
> ### What this fork changes
>
> - **Extra reading fonts.** Nine free ([SIL OFL](https://openfontlicense.org))
>   families bundled and ready to select in the reader, each shipped as proper
>   Regular / Bold / Italic / Bold Italic cuts so bold and italic style-linking
>   works in the crengine renderer:
>   - *Serif:* Literata, Bitter, Source Serif 4, Vollkorn, Lora
>   - *Sans-serif:* Atkinson Hyperlegible, Inter, Open Sans, Libre Franklin
>
>   `resources/fonts/` was converted from a submodule to a tracked directory so
>   these ship with the repo. Proprietary fonts (e.g. Amazon's Bookerly) are
>   **not** redistributed here — drop your own copy into
>   `resources/fonts/bookerly/` and rebuild; it is auto-discovered.
> - **SimpleUI plugin, bundled and enabled by default** — a distraction-free
>   home screen, customisable bottom navigation bar, top status bar, and a
>   reworked library title bar
>   ([doctorhetfield-cmd/simpleui.koplugin](https://github.com/doctorhetfield-cmd/simpleui.koplugin),
>   MIT). Configure it under *Menu → Tools → SimpleUI*.
> - **Behaviour fixes** in `frontend/device/sdl/device.lua` and `reader.lua`:
>   - Removed the automatic hardware-keyboard detection that caused typed
>     characters to leak into the cover gallery / file browser.
>   - Fixed the Quickstart guide that kept reopening on every launch.
>
> Everything else — the iOS app bundle, iCloud Drive folder picker, monolibtic
> build, LuaJIT bytecode precompilation — comes from the upstream port, unchanged.
>
> ### Building
>
> ```sh
> brew install autoconf automake bash binutils cmake coreutils findutils \
>     gettext gnu-getopt libtool make meson nasm ninja pkgconf sdl3 \
>     util-linux xcodegen
> export PATH="$(brew --prefix)/opt/findutils/libexec/gnubin:$(brew --prefix)/opt/gnu-getopt/bin:$(brew --prefix)/opt/make/libexec/gnubin:$(brew --prefix)/opt/util-linux/bin:${PATH}"
> make TARGET=ios xcodeproj
> open KOReader.xcodeproj   # set your signing Team, then ⌘R on a connected device
> ```
>
> Full prerequisites and troubleshooting live in
> [`doc/Building_iOS.md`](doc/Building_iOS.md). The native base submodule is
> [hezi/koreader-base-ios](https://github.com/hezi/koreader-base-ios).

---

#### KOReader is a document viewer primarily aimed at e-ink readers.

[![AGPL Licence][badge-license]](COPYING)
[![Latest release][badge-release]][link-gh-releases]
[![Gitter][badge-gitter]][link-gitter]
[![Mobileread][badge-mobileread]][link-forum]
[![Build Status][badge-circleci]][link-circleci]
[![Coverage Status][badge-coverage]][link-coverage]
[![Weblate Status][badge-weblate]][link-weblate]

[Download](https://github.com/koreader/koreader/releases) •
[User guide](http://koreader.rocks/user_guide/) •
[Wiki](https://github.com/koreader/koreader/wiki) •
[Developer docs](http://koreader.rocks/doc/)

## Main features

* **portable**: runs on embedded devices (Cervantes, Kindle, Kobo, PocketBook, reMarkable), Android and Linux computers. Developers can run a KOReader emulator in Linux and MacOS.

* **multi-format documents**: supports fixed page formats (PDF, DjVu, CBT, CBZ) and reflowable e-book formats (EPUB, FB2, Mobi, DOC, RTF, HTML, CHM, TXT). Scanned PDF/DjVu documents can also be reflowed with the built-in K2pdfopt library. [ZIP files][link-wiki-zip] are also supported for some formats.

* **full-featured reading**: multi-lingual user interface with a highly customizable reader view and many typesetting options. You can set arbitrary page margins, override line spacing and choose external fonts and styles. It has multi-lingual hyphenation dictionaries bundled into the application.

* **integrated** with *calibre* (search metadata, receive ebooks wirelessly, browse library via OPDS), *Wallabag*, *Wikipedia*, *Google Translate* and other content providers.

* **optimized for e-ink devices**: custom UI without animation, with paginated menus, adjustable text contrast, and easy zoom to fit content or page in paged media.

* **extensible**: via plugins

* **fast**: on some older devices, it has been measured to have less than half the page-turn delay as the built in reading software.

* **and much more**: look up words with StarDict dictionaries / Wikipedia, add your own online OPDS catalogs and RSS feeds, over-the-air software updates, an FTP client, an SSH server, …

Please check the [user guide](http://koreader.rocks/user_guide/) and the [wiki][link-wiki] to discover more features and to help us document them.

## Screenshots

<a href="https://github.com/koreader/koreader-artwork/raw/master/koreader-menu.png"><img src="https://github.com/koreader/koreader-artwork/raw/master/koreader-menu-thumbnail.png" alt="" width="200px"></a>
<a href="https://github.com/koreader/koreader-artwork/raw/master/koreader-footnotes.png"><img src="https://github.com/koreader/koreader-artwork/raw/master/koreader-footnotes-thumbnail.png" alt="" width="200px"></a>
<a href="https://github.com/koreader/koreader-artwork/raw/master/koreader-dictionary.png"><img src="https://github.com/koreader/koreader-artwork/raw/master/koreader-dictionary-thumbnail.png" alt="" width="200px"></a>

## Installation

Please follow the model specific steps for your device:

[Android](https://github.com/koreader/koreader/wiki/Installation-on-Android-devices) •
[Cervantes](https://github.com/koreader/koreader/wiki/Installation-on-BQ-devices) •
[Kindle](https://github.com/koreader/koreader/wiki/Installation-on-Kindle-devices) •
[Kobo](https://github.com/koreader/koreader/wiki/Installation-on-Kobo-devices) •
[Linux](https://github.com/koreader/koreader/wiki/Installation-on-desktop-linux) •
[Pocketbook](https://github.com/koreader/koreader/wiki/Installation-on-PocketBook-devices) •
[reMarkable](https://github.com/koreader/koreader/wiki/Installation-on-Remarkable)


## Development

[Setting up a build environment](doc/Building.md) •
[Collaborating with Git](doc/Collaborating_with_Git.md) •
[Building targets](doc/Building_targets.md) •
[Porting](doc/Porting.md) •
[Developer docs](http://koreader.rocks/doc/)

## Support

KOReader is developed and supported by volunteers all around the world. There are many ways you can help:

- [fix bugs][link-issues-bugs] and [implement new features][link-issues-features]
- [translate the program into your language][link-weblate] or improve an existing translation
- document lesser-known features on the [wiki][link-wiki]
- help others with your knowledge on the [forum][link-forum]

Right now we only support [liberapay](https://liberapay.com/KOReader) donations.

## Contributors

[![Last commit][badge-last-commit]][link-gh-commits]
[![Commit activity][badge-commit-activity]][link-gh-insights]

[badge-bountysource]:https://img.shields.io/bountysource/team/koreader/activity?color=red
[badge-circleci]:https://circleci.com/gh/koreader/koreader.svg?style=shield
[badge-coverage]:https://codecov.io/gh/koreader/koreader/branch/master/graph/badge.svg
[badge-commit-activity]:https://img.shields.io/github/commit-activity/m/koreader/koreader
[badge-gitter]:https://img.shields.io/gitter/room/koreader/koreader?color=red
[badge-last-commit]:https://img.shields.io/github/last-commit/koreader/koreader?color=orange
[badge-license]:https://img.shields.io/github/license/koreader/koreader
[badge-release]:https://img.shields.io/github/release/koreader/koreader.svg
[badge-mobileread]:https://img.shields.io/badge/forum-on_mobileread-lightgrey
[badge-weblate]:https://hosted.weblate.org/widgets/koreader/-/koreader/svg-badge.svg

[link-bountysource]:https://www.bountysource.com/teams/koreader
[link-circleci]:https://circleci.com/gh/koreader/koreader
[link-coverage]:https://codecov.io/gh/koreader/koreader
[link-forum]:http://www.mobileread.com/forums/forumdisplay.php?f=276
[link-gh-commits]:https://github.com/koreader/koreader/commits/master
[link-gh-insights]:https://github.com/koreader/koreader/pulse
[link-gh-releases]:https://github.com/koreader/koreader/releases
[link-gitter]:https://gitter.im/koreader/koreader
[link-issues-bugs]:https://github.com/koreader/koreader/issues?q=is%3Aopen+is%3Aissue+label%3Abug
[link-issues-features]:https://github.com/koreader/koreader/issues?q=is%3Aopen+is%3Aissue+label%3Aenhancement
[link-weblate]:https://hosted.weblate.org/engage/koreader/?utm_source=widget
[link-wiki]:https://github.com/koreader/koreader/wiki
[link-wiki-zip]:https://github.com/koreader/koreader/wiki/ZIP
