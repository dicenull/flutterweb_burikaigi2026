import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class TocSlide extends FlutterDeckSlideWidget {
  const TocSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(route: '/toc'),
        );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('目次', style: theme.textTheme.displayLarge),
            const SizedBox(height: 32),
            ...[
              'Flutter Webとは',
              'マルチプラットフォーム開発',
              '既存Webコードとの連携',
              'WebAssembly (WASM)',
              '実例とデモ',
              'まとめ'
            ].asMap().entries.map(
                  (entry) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      '${entry.key + 1}. ${entry.value}',
                      style: theme.textTheme.headlineLarge,
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}

