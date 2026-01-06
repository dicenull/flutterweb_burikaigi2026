import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:burikaigi2026_slide/widgets/code_demo_slide.dart';
import 'package:burikaigi2026_slide/widgets/counter_demo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class RiverpodHooksDemoSlide extends FlutterDeckSlideWidget {
  const RiverpodHooksDemoSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/riverpod-hooks-demo',
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
            code: _riverpodHooksCode,
            highlightedLines: const {5, 14, 17, 18, 35},
            theme: theme,
            colorScheme: colorScheme,
          ),
        ),
        demoContent: const CounterDemo(),
      ),
    );
  }

  static const String _riverpodHooksCode =
      '''import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// カウンターの状態を管理するProvider
final counterProvider = StateProvider<int>((ref) => 0);

// RiverpodHooksを使ったカウンターアプリ
class RiverpodHooksCounter extends HookConsumerWidget {
  const RiverpodHooksCounter({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Providerから状態を取得
    final counter = ref.watch(counterProvider);

    // カウンターを増やす関数
    final increment = () {
      ref.read(counterProvider.notifier).state++;
    };

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 32.0,
          children: [
            Text(
              '\$counter',
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}''';
}
