# somei-san/tap

macOS 向け自作ツールを Homebrew で配布するための Tap リポジトリです。

```bash
brew tap somei-san/tap
```

---

## 🐻 貼っとっと (Hattotto)

デスクトップにぺたぺた貼れる、熊の手つき付箋アプリ。
Markdown 対応・自動保存・ゴミ箱復元など、macOS Stickies の「惜しい」を解消します。

[リポジトリ](https://github.com/somei-san/hattotto)

<p align="center">
  <img src="https://raw.githubusercontent.com/somei-san/hattotto/main/assets/hero.svg" alt="貼っとっと スクリーンショット" width="600" />
</p>

### インストール

```bash
brew trust somei-san/tap
brew install --cask somei-san/tap/hattotto
```

`brew trust` は初回のみ必要です。Homebrew 6 以降、信頼していない tap の cask は読み込まれません。これを省くと `brew upgrade` が hattotto をエラーも出さず飛ばすため、更新されないことに気づきにくくなります（cask のみ。下記 cliip-show は formula なので不要です）。

---

## 🥜 cliip-show

コピーしたテキストを画面に HUD 表示する常駐アプリ。
「コピーしたつもりができてなかった」をなくします。

[リポジトリ](https://github.com/somei-san/cliip-show)

![cliip-show HUD の表示イメージ](https://raw.githubusercontent.com/somei-san/cliip-show/main/docs/assets/cliip-show-hud.gif)


### インストール & 起動

```bash
brew install somei-san/tap/cliip-show
brew services start cliip-show
```

### 初期設定（お好みで）

```bash
cliip-show --config init                        # 設定ファイルを生成
cliip-show --config set hud_position top        # 表示位置 (top / center / bottom)
cliip-show --config set hud_duration_secs 2.0   # 表示時間
brew services restart cliip-show                # 設定を反映
```

> 全設定項目 → [somei-san/cliip-show](https://github.com/somei-san/cliip-show?tab=readme-ov-file#%E8%A1%A8%E7%A4%BA%E8%A8%AD%E5%AE%9A)
