# スライド作成ガイド

このドキュメントでは、Flutter Deckを使用したプレゼンテーションスライドの作成方法を説明します。

## 目次

1. [プロジェクト構成](#プロジェクト構成)
2. [スライドの基本構造](#スライドの基本構造)
3. [スライドテンプレート](#スライドテンプレート)
4. [共通コンポーネント](#共通コンポーネント)
5. [テーマシステム](#テーマシステム)
6. [デザイン定数](#デザイン定数)
7. [スライド追加手順](#スライド追加手順)

---

## プロジェクト構成

```
lib/
├── main.dart                 # アプリケーションエントリ、スライド登録
├── theme/
│   ├── slide_text_theme.dart # テキストスタイル定義
│   └── slide_dimensions.dart # デザイン定数（パディング、スペーシング等）
├── widgets/
│   ├── section_slide.dart    # セクション区切りスライドコンテンツ
│   ├── info_card.dart        # 汎用情報カード
│   ├── counter_demo.dart     # カウンターデモWidget
│   ├── code_block.dart       # コードブロック表示
│   └── code_demo_slide.dart  # コード+デモレイアウト
└── slides/
    └── *.dart                # 各スライド
```

---

## スライドの基本構造

すべてのスライドは `FlutterDeckSlideWidget` を継承します。

```dart
import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class MySlide extends FlutterDeckSlideWidget {
  const MySlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/my-slide',  // ユニークなルート名
          ),
        );

  @override
  Widget build(BuildContext context) {
    final theme = context.slideTextTheme;  // テキストテーマ取得
    return FlutterDeckSlide.blank(
      builder: (context) => /* スライドコンテンツ */,
    );
  }
}
```

### main.dartへの登録

作成したスライドは `main.dart` の `slides` リストに追加します。

```dart
slides: const [
  // ... 既存のスライド
  MySlide(),  // 新しいスライドを追加
],
```

---

## スライドテンプレート

### 1. セクション区切りスライド

章・セクションの区切りに使用します。

```dart
import 'package:burikaigi2026_slide/widgets/section_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class MySectionSlide extends FlutterDeckSlideWidget {
  const MySectionSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/my-section',
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const SectionSlideContent(
        title: '1. セクションタイトル',
      ),
    );
  }
}
```

### 2. コンテンツスライド（左揃え）

標準的な説明スライドに使用します。

```dart
@override
Widget build(BuildContext context) {
  final theme = context.slideTextTheme;
  return FlutterDeckSlide.blank(
    builder: (context) => Padding(
      padding: const EdgeInsets.all(SlideDimensions.screenPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: SlideDimensions.sectionSpacing,
        children: [
          Text('スライドタイトル', style: theme.heading),
          Text('説明文', style: theme.body),
          // ... その他のコンテンツ
        ],
      ),
    ),
  );
}
```

### 3. コード + デモスライド

コードとライブデモを並べて表示します。

```dart
import 'package:burikaigi2026_slide/widgets/code_demo_slide.dart';
import 'package:burikaigi2026_slide/widgets/counter_demo.dart';

@override
Widget build(BuildContext context) {
  final theme = context.slideTextTheme;
  final colorScheme = Theme.of(context).colorScheme;
  return FlutterDeckSlide.blank(
    builder: (context) => CodeDemoSlide(
      codeContent: SelectableText.rich(
        HighlightedCodeBuilder.buildHighlightedCode(
          code: _myCode,
          highlightedLines: const {5, 10, 15},  // ハイライト行
          theme: theme,
          colorScheme: colorScheme,
        ),
      ),
      demoContent: const CounterDemo(),  // デモWidget
    ),
  );
}

static const String _myCode = '''
// コード内容
class Example {
  // ...
}
''';
```

### 4. 2カラムレイアウト

左右に分割したレイアウトです。

```dart
@override
Widget build(BuildContext context) {
  return FlutterDeckSlide.blank(
    builder: (context) => Padding(
      padding: const EdgeInsets.all(SlideDimensions.screenPadding),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: /* 左側コンテンツ */,
          ),
          const SizedBox(width: SlideDimensions.sectionSpacing),
          Expanded(
            flex: 2,
            child: /* 右側コンテンツ */,
          ),
        ],
      ),
    ),
  );
}
```

---

## 共通コンポーネント

### InfoCard

情報を強調表示するカードコンポーネントです。

```dart
import 'package:burikaigi2026_slide/widgets/info_card.dart';

// 通常サイズ
const InfoCard(
  title: 'タイトル',
  subtitle: 'サブタイトル',
  description: '説明文',
  isHighlighted: true,           // ハイライト表示
  highlightIcon: Icons.check_circle,  // アイコン
)

// コンパクトサイズ
const InfoCard(
  title: 'タイトル',
  subtitle: 'サブタイトル',
  description: '説明文',
  size: InfoCardSize.compact,
)
```

### CodeBlock / SimpleCodeBlock

コードを表示するブロックです。

```dart
import 'package:burikaigi2026_slide/widgets/code_block.dart';

// シンプルなテキストコード
const SimpleCodeBlock(
  text: 'flutter build web --release',
)

// カスタムコンテンツ
CodeBlock(
  scrollable: true,
  child: SelectableText(code),
)
```

### CounterDemo

カウンターアプリのデモWidgetです。

```dart
import 'package:burikaigi2026_slide/widgets/counter_demo.dart';

const CounterDemo()
```

---

## テーマシステム

### テキストスタイル

`context.slideTextTheme` で取得できます。

| スタイル | フォントサイズ | 用途 |
|---------|--------------|------|
| `title` | 120 | メインタイトル |
| `subtitle` | 96 | サブタイトル |
| `sectionTitle` | 120 | セクション区切り |
| `heading` | 80 | スライド見出し |
| `body` | 50 | 本文 |
| `code` | 32 | コード |
| `tocItem` | 50 | 目次項目 |

```dart
final theme = context.slideTextTheme;

Text('見出し', style: theme.heading)
Text('本文', style: theme.body)
Text('コード', style: theme.code)

// カスタマイズ
Text(
  'カスタム',
  style: theme.body.copyWith(
    fontWeight: FontWeight.bold,
    color: colorScheme.primary,
  ),
)
```

### カラースキーム

Material 3のカラースキームを使用します。

```dart
final colorScheme = Theme.of(context).colorScheme;

colorScheme.primary          // プライマリカラー
colorScheme.onSurface        // テキスト色
colorScheme.surfaceContainerHighest  // 背景色
colorScheme.error            // エラー色
```

---

## デザイン定数

`SlideDimensions` クラスで定義された定数を使用します。

```dart
import 'package:burikaigi2026_slide/theme/slide_dimensions.dart';
```

### パディング

| 定数 | 値 | 用途 |
|-----|-----|------|
| `screenPadding` | 48.0 | 画面全体のパディング |
| `cardPadding` | 24.0 | カード内部のパディング |
| `smallPadding` | 16.0 | 小要素のパディング |

### スペーシング

| 定数 | 値 | 用途 |
|-----|-----|------|
| `sectionSpacing` | 32.0 | セクション間隔 |
| `itemSpacing` | 24.0 | アイテム間隔 |
| `smallSpacing` | 16.0 | 小間隔 |
| `tinySpacing` | 8.0 | 極小間隔 |

### ボーダー

| 定数 | 値 | 用途 |
|-----|-----|------|
| `borderRadiusLarge` | 12.0 | カードの角丸 |
| `borderRadiusSmall` | 8.0 | 小要素の角丸 |

### 使用例

```dart
Padding(
  padding: const EdgeInsets.all(SlideDimensions.screenPadding),
  child: Column(
    spacing: SlideDimensions.sectionSpacing,
    children: [
      // ...
    ],
  ),
)
```

---

## スライド追加手順

### 1. ファイル作成

`lib/slides/` に新しいDartファイルを作成します。

```bash
touch lib/slides/my_new_slide.dart
```

### 2. スライドクラス実装

適切なテンプレートを選んで実装します。

### 3. main.dartに登録

```dart
// lib/main.dart
import 'package:burikaigi2026_slide/slides/my_new_slide.dart';

// slides リストに追加
slides: const [
  // ... 既存のスライド
  MyNewSlide(),  // 表示順に追加
],
```

### 4. 動作確認

```bash
flutter run -d chrome
```

---

## ベストプラクティス

1. **定数を使用する**: マジックナンバーは `SlideDimensions` を使用
2. **テーマを活用する**: `context.slideTextTheme` でスタイル取得
3. **透明度API**: `withOpacity()` ではなく `withValues(alpha:)` を使用
4. **constを活用**: 可能な限り `const` コンストラクタを使用
5. **命名規則**: ファイル名は `snake_case`、クラス名は `PascalCase`

---

## 参考リンク

- [flutter_deck パッケージ](https://pub.dev/packages/flutter_deck)
- [Material 3 カラーシステム](https://m3.material.io/styles/color/overview)
