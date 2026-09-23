# somei-san/tap

[English](README.en.md)

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

`brew trust` は初回のみ必要です。Homebrew 6 以降、信頼していない tap の cask は読み込まれません。これを省くと `brew upgrade` が hattotto をエラーも出さず飛ばすため、更新されないことに気づきにくくなります。

---

## 🥜 Cliip Show

コピーした内容を画面に HUD 表示する常駐アプリ。
「コピーしたつもりができてなかった」をなくします。テキストはそのまま、画像はサムネイルで表示します。

[リポジトリ](https://github.com/somei-san/cliip-show)

![Cliip Show HUD の表示イメージ](https://raw.githubusercontent.com/somei-san/cliip-show/main/docs/assets/cliip-show-hud.gif)


### インストール & 起動

```bash
brew trust somei-san/tap
brew install --cask somei-san/tap/cliip-show
open -a "Cliip Show"
```

初回だけ手動で起動します。起動時に出るダイアログで自動起動を有効にすれば、次回ログインからは自動で立ち上がります。

Apple の Developer ID で署名していないため、インストール時に quarantine 属性を外します。

### 設定

メニューバーのアイコンから「設定…」を開いて変更します。設定を変更する手段はこれだけです。「お試し表示」で見た目を確認しながら調整できます。

> 全設定項目 → [somei-san/cliip-show](https://github.com/somei-san/cliip-show/blob/main/docs/development.md#%E8%A8%AD%E5%AE%9A%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%81%A8%E7%92%B0%E5%A2%83%E5%A4%89%E6%95%B0)

---

## メンテナンス

`Casks/` の cask は、各ツールのリリース時に GitHub Actions が生成元から作り直して上書きします。cask を直すときは生成元も同じ内容に直してください。tap 側だけ直すと、次のリリースで元に戻ります。

- hattotto: [`.github/workflows/release.yml` のヒアドキュメント](https://github.com/somei-san/hattotto/blob/d399af9954ecd4f800c49875b7ec54f73defc4c3/.github/workflows/release.yml#L71-L96)
- cliip-show: [`packaging/homebrew/cliip-show.rb.template`](https://github.com/somei-san/cliip-show/blob/ba3abd0f1d72986bc4e71f9b0f83f530443d93db/packaging/homebrew/cliip-show.rb.template)
