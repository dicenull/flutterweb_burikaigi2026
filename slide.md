---
marp: true
theme: flutter-web
paginate: true
backgroundColor: #EEEEEE
---

<!-- _class: lead -->

# Flutter Web入門

## マルチプラットフォーム開発からWebAssemblyまで

---

<!-- _class: lead -->

# 1. Flutter マルチプラットフォーム

---

## Flutterとは

- **Google製のUIフレームワーク**
- **言語:** Dart
- **特徴:** マルチプラットフォーム対応
  - 1つのプロジェクトでiOS / Android / Web / Desktopに対応
- **UIの仕組み:** すべてが **Widget**
  - プラットフォームごとのUI差分なし
  - パッケージ（pub.dev）が複数のプラットフォームをサポート

---

<!-- _class: lead -->

# UI = f(state)

---

## 【Demo】Flutterの基本

- **DartPad** を使ったカウンターコードの紹介
- **Widget Tree** の構造：
  - `Scaffold` > `AppBar` / `Center` > `Column` > `Text`
- ボタンを押すと `setState()` で画面が更新される仕組みを体感

<!-- Flutter Webで作って、左コード、右プレビューで表示する -->

---

## Flutterの歴史

- **2018年:** Dart 2.0 / Flutter 1.0 リリース（モバイル中心）
- **2021年:** Flutter 2.0 **Web Stable**
- **2022年:** Flutter 3.0 **Desktop Stable**

2026年現在、主要プラットフォームをカバー

---

---

## Flutter WebってプロダクトReadyなの？

### **結論：弊社ではフル活用しています！**

- **事例:** 「ふわっち」のモバイルWeb版
  - 視聴・配信機能の両方をFlutter Webで構築
- **メリット:** モバイルアプリに近い体験をWebで提供可能
- **本日のメイン:** その中で見えてきた「既存資産」や「最新技術」との付き合い方

---

# 2. WebComponentsの活用

---

## なぜWebComponents (WC) を使うのか？

- **Flutter Webでできないことを補完する**
  - Flutter側でまだサポートされていないブラウザ固有の技術を使いたい
  - 既存のJS資産（チャットUI、特殊なプレイヤー等）を再利用したい
- **WCの作り方:**
  - ピュアなHTML/CSS/JSで構築
  - Angularなどのフレームワークから書き出し

---

## Flutter Webへの埋め込み

- `HtmlElementView` を利用して、FlutterのWidget Tree内にWCを配置
- 詳細は弊社のエンジニアブログ（Zenn）で公開中！

> **参考記事:**
> [Flutter WebでWeb Componentsを活用する](https://zenn.dev/jigjp_engineer/articles/cc7fbc31d045d)

---

# 3. WebAssembly (WASM) の話

---

## WASM対応で変わるレンダリング

- **Flutter 3.22** 以降でWASMビルドが正式対応！
- 従来のJavaScriptビルド（CanvasKit/SKWA）との違い
  - **パフォーマンス向上:** より滑らかなアニメーション
  - **バイナリサイズ:** 効率的な実行

---

## WASMビルドを試す

ビルドコマンドは非常にシンプルです：

```bash
flutter build web --wasm
```
