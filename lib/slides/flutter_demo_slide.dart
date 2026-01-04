import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:burikaigi2026_slide/widgets/code_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class FlutterDemoSlide extends FlutterDeckSlideWidget {
  const FlutterDemoSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-demo',
          ),
        );

  @override
  Widget build(BuildContext context) {
    final theme = context.slideTextTheme;
    final materialTheme = Theme.of(context);
    final colorScheme = materialTheme.colorScheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(48),
        child: Row(
          children: [
            // 左側: コードテキスト
            Expanded(
              flex: 3,
              child: CodeBlock(
                scrollable: true,
                child: SelectableText.rich(
                  _buildHighlightedCode(context, theme, colorScheme),
                ),
              ),
            ),
            const SizedBox(width: 24),
            // 右側: 実行画面
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.shadow.withValues(alpha: 0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const _CounterDemo(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static const String _counterCode =
      '''class _CounterDemo extends StatefulWidget {
  const _CounterDemo();

  @override
  State<_CounterDemo> createState() => _CounterDemoState();
}

class _CounterDemoState extends State<_CounterDemo> {
  int _counter = 0;

  void _incrementCounter() {
    // 状態を更新する
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 宣言的UI 状態が変わるとUIが更新される
            Text('\$_counter'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}''';

  TextSpan _buildHighlightedCode(
    BuildContext context,
    SlideTextTheme theme,
    ColorScheme colorScheme,
  ) {
    final lines = _counterCode.split('\n');
    // 78-81行目（ファイル内）は_counterCode内で11-14行目（0ベースで10-13）
    // 91-92行目（ファイル内）は_counterCode内で25-26行目（0ベースで24-25）
    final highlightedLines = {11, 12, 13, 14, 24, 25};

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

// カウンターアプリのデモ
class _CounterDemo extends StatefulWidget {
  const _CounterDemo();

  @override
  State<_CounterDemo> createState() => _CounterDemoState();
}

class _CounterDemoState extends State<_CounterDemo> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 32.0,
          children: <Widget>[
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: _incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
