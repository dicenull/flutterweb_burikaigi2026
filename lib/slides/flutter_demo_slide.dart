import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:burikaigi2026_slide/widgets/code_demo_slide.dart';
import 'package:burikaigi2026_slide/widgets/counter_demo.dart';
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
    final colorScheme = Theme.of(context).colorScheme;
    return FlutterDeckSlide.blank(
      builder: (context) => CodeDemoSlide(
        codeContent: SelectableText.rich(
          HighlightedCodeBuilder.buildHighlightedCode(
            code: _counterCode,
            highlightedLines: const {18, 19, 24, 25, 26, 27, 28, 29},
            theme: theme,
            colorScheme: colorScheme,
          ),
        ),
        demoContent: const CounterDemo(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('カウント'),
            // 宣言的UI 状態が変わるとUIが更新される
            Text('\$_counter'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          // 状態を更新する
          setState(() {
            _counter++;
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}''';
}
