# somei-san/tap

[日本語](README.md)

A Homebrew tap for distributing my own macOS tools.

```bash
brew tap somei-san/tap
```

---

## 🐻 Hattotto (貼っとっと)

Sticky notes you slap onto the desktop, with a bear paw on top.
Markdown support, autosave and restore from the trash — it fills in what macOS Stickies leaves out.

[Repository](https://github.com/somei-san/hattotto)

<p align="center">
  <img src="https://raw.githubusercontent.com/somei-san/hattotto/main/assets/hero.svg" alt="Hattotto screenshot" width="600" />
</p>

### Install

```bash
brew trust somei-san/tap
brew install --cask somei-san/tap/hattotto
```

`brew trust` is needed once. Since Homebrew 6, casks from an untrusted tap are not loaded, and skipping this makes `brew upgrade` pass over hattotto without an error — you would not notice it stopped updating.

---

## 🥜 Cliip Show

A menu bar app that shows what you just copied in a HUD.
No more "you thought you copied it, but you didn't". Text is shown as-is, images as a thumbnail.

[Repository](https://github.com/somei-san/cliip-show)

![Cliip Show HUD demo](https://raw.githubusercontent.com/somei-san/cliip-show/main/docs/assets/cliip-show-hud.gif)


### Install & launch

```bash
brew trust somei-san/tap
brew install --cask somei-san/tap/cliip-show
open -a "Cliip Show"
```

Launch it by hand the first time. Turn on start at login in the dialog it shows, and it comes up on its own from the next login.

Cliip Show is not signed with an Apple Developer ID, so the cask clears the quarantine attribute for you.

### Settings

Open "Settings…" from the menu bar icon. That is the only way to change them. "Preview" lets you check how it looks while you adjust.

> Full list of settings → [somei-san/cliip-show](https://github.com/somei-san/cliip-show/blob/main/docs/development.md#%E8%A8%AD%E5%AE%9A%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%81%A8%E7%92%B0%E5%A2%83%E5%A4%89%E6%95%B0)
