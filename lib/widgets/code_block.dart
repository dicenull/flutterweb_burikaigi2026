import 'package:burikaigi2026_slide/theme/slide_dimensions.dart';
import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';

/// コードブロックを表示するウィジェット
class CodeBlock extends StatelessWidget {
  const CodeBlock({
    super.key,
    required this.child,
    this.padding,
    this.scrollable = false,
  });

  /// コードブロック内に表示するウィジェット
  final Widget child;

  /// パディング（デフォルト: EdgeInsets.all(SlideDimensions.cardPadding)）
  final EdgeInsets? padding;

  /// スクロール可能にするか（デフォルト: false）
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    final materialTheme = Theme.of(context);
    final colorScheme = materialTheme.colorScheme;

    final content = Container(
      padding: padding ?? const EdgeInsets.all(SlideDimensions.cardPadding),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(SlideDimensions.borderRadiusSmall),
      ),
      child: child,
    );

    if (scrollable) {
      return SingleChildScrollView(child: content);
    }

    return content;
  }
}

/// シンプルなテキストコードブロック
class SimpleCodeBlock extends StatelessWidget {
  const SimpleCodeBlock({
    super.key,
    required this.text,
    this.style,
    this.padding,
  });

  /// 表示するコードテキスト
  final String text;

  /// テキストスタイル（デフォルト: theme.code）
  final TextStyle? style;

  /// パディング（デフォルト: EdgeInsets.all(SlideDimensions.cardPadding)）
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final theme = context.slideTextTheme;
    return CodeBlock(
      padding: padding,
      child: Text(
        text,
        style: style ?? theme.code,
      ),
    );
  }
}

