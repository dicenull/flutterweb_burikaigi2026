import 'package:burikaigi2026_slide/theme/slide_dimensions.dart';
import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:burikaigi2026_slide/widgets/code_block.dart';
import 'package:flutter/material.dart';

/// コードとデモを左右に配置するスライドレイアウト
class CodeDemoSlide extends StatelessWidget {
  const CodeDemoSlide({
    super.key,
    required this.codeContent,
    required this.demoContent,
    this.codeFlex = 3,
    this.demoFlex = 1,
    this.spacing = 24.0,
  });

  /// コードブロックに表示するウィジェット
  final Widget codeContent;

  /// デモプレビューに表示するウィジェット
  final Widget demoContent;

  /// コードブロックのflex（デフォルト: 3）
  final int codeFlex;

  /// デモプレビューのflex（デフォルト: 1）
  final int demoFlex;

  /// コードとデモの間のスペーシング（デフォルト: SlideDimensions.itemSpacing）
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(SlideDimensions.screenPadding),
      child: Row(
        children: [
          // 左側: コードテキスト
          Expanded(
            flex: codeFlex,
            child: CodeBlock(
              scrollable: true,
              child: codeContent,
            ),
          ),
          SizedBox(width: spacing),
          // 右側: 実行画面
          Expanded(
            flex: demoFlex,
            child: _DemoPreview(child: demoContent),
          ),
        ],
      ),
    );
  }
}

/// デモプレビュー用のコンテナ
class _DemoPreview extends StatelessWidget {
  const _DemoPreview({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: const EdgeInsets.all(SlideDimensions.cardPadding),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(SlideDimensions.borderRadiusSmall),
        boxShadow: [
          BoxShadow(
            color: colorScheme.shadow.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: child,
    );
  }
}

/// ハイライト機能付きコードブロックのビルダー
class HighlightedCodeBuilder {
  /// コードテキストを行番号のセットでハイライトする
  static TextSpan buildHighlightedCode({
    required String code,
    required Set<int> highlightedLines,
    required SlideTextTheme theme,
    required ColorScheme colorScheme,
  }) {
    final lines = code.split('\n');
    final spans = <TextSpan>[];

    for (int i = 0; i < lines.length; i++) {
      final isHighlighted = highlightedLines.contains(i);
      final style = isHighlighted
          ? theme.code.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
            )
          : theme.code;

      spans.add(TextSpan(
        text: lines[i],
        style: style,
      ));

      if (i < lines.length - 1) {
        spans.add(const TextSpan(text: '\n'));
      }
    }

    return TextSpan(children: spans);
  }
}
