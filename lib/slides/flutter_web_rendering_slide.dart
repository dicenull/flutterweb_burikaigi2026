import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class FlutterWebRenderingSlide extends FlutterDeckSlideWidget {
  const FlutterWebRenderingSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-web-rendering',
          ),
        );

  @override
  Widget build(BuildContext context) {
    final theme = context.slideTextTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 32.0,
          children: [
            Text(
              'Flutter Webのレンダリング方式比較',
              style: theme.heading,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Table(
                  border: TableBorder.all(
                    color: colorScheme.outline.withOpacity(0.3),
                    width: 1,
                  ),
                  columnWidths: const {
                    0: FlexColumnWidth(1.2),
                    1: FlexColumnWidth(1),
                    2: FlexColumnWidth(1),
                    3: FlexColumnWidth(1),
                  },
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest,
                      ),
                      children: [
                        _TableCell('方式', theme, isHeader: true),
                        _TableCell('HTML', theme, isHeader: true),
                        _TableCell('CanvasKit', theme, isHeader: true),
                        _TableCell('WASM', theme, isHeader: true),
                      ],
                    ),
                    TableRow(
                      children: [
                        _TableCell('状態', theme),
                        _TableCell('廃止', theme,
                            isHighlighted: true, isWarning: true),
                        _TableCell('現時点で推奨', theme, isHighlighted: true),
                        _TableCell('将来推奨', theme, isHighlighted: true),
                      ],
                    ),
                    TableRow(
                      children: [
                        _TableCell('パフォーマンス', theme),
                        _TableCell('低', theme,
                            isHighlighted: true, isWarning: true),
                        _TableCell('高', theme, isHighlighted: true),
                        _TableCell('最高', theme,
                            isHighlighted: true, isBest: true),
                      ],
                    ),
                    TableRow(
                      children: [
                        _TableCell('SEO対応', theme),
                        _TableCell('可', theme),
                        _TableCell('部分的', theme),
                        _TableCell('部分的', theme),
                      ],
                    ),
                    TableRow(
                      children: [
                        _TableCell('起動速度', theme),
                        _TableCell('速い', theme),
                        _TableCell('やや遅い', theme),
                        _TableCell('やや遅い', theme),
                      ],
                    ),
                    TableRow(
                      children: [
                        _TableCell('ファイルサイズ', theme),
                        _TableCell('小さい', theme,
                            isHighlighted: true, isBest: true),
                        _TableCell('大きい (2.4MB)', theme,
                            isHighlighted: true, isWarning: true),
                        _TableCell('中程度 (1.9MB)', theme, isHighlighted: true),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TableCell extends StatelessWidget {
  const _TableCell(
    this.text,
    this.theme, {
    this.isHeader = false,
    this.isHighlighted = false,
    this.isWarning = false,
    this.isBest = false,
  });

  final String text;
  final SlideTextTheme theme;
  final bool isHeader;
  final bool isHighlighted;
  final bool isWarning;
  final bool isBest;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    TextStyle textStyle = theme.body;

    if (isHeader) {
      textStyle = theme.body.copyWith(fontWeight: FontWeight.bold);
    } else if (isHighlighted) {
      if (isWarning) {
        textStyle = theme.body.copyWith(
          fontWeight: FontWeight.bold,
          color: colorScheme.error,
        );
      } else if (isBest) {
        textStyle = theme.body.copyWith(
          fontWeight: FontWeight.bold,
          color: colorScheme.primary,
        );
      } else {
        textStyle = theme.body.copyWith(
          fontWeight: FontWeight.bold,
          color: colorScheme.primary,
        );
      }
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: isHighlighted && !isHeader
          ? BoxDecoration(
              color: isWarning
                  ? colorScheme.errorContainer.withOpacity(0.3)
                  : isBest
                      ? colorScheme.primaryContainer.withOpacity(0.3)
                      : colorScheme.primaryContainer.withOpacity(0.2),
            )
          : null,
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}

class FlutterWebRenderingConclusionSlide extends FlutterDeckSlideWidget {
  const FlutterWebRenderingConclusionSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-web-rendering-conclusion',
          ),
        );

  @override
  Widget build(BuildContext context) {
    final theme = context.slideTextTheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 32.0,
          children: [
            Text(
              'レンダリング方式の選択',
              style: theme.heading,
            ),
            const SizedBox(height: 48),
            Text(
              '結論',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 32.0,
                children: [
                  Text(
                    '該当するIssueがなければWASM推奨',
                    style: theme.body,
                  ),
                  Text(
                    '現時点ではCanvasKit',
                    style: theme.body,
                  ),
                  Text(
                    'HTMLレンダリングは廃止されている',
                    style: theme.body,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
