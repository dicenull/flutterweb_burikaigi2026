import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class WasmBuildSlide extends FlutterDeckSlideWidget {
  const WasmBuildSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/wasm-build',
          ),
        );

  @override
  Widget build(BuildContext context) {
    final materialTheme = Theme.of(context);
    final slideTheme = context.slideTextTheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'WASMビルドを試す',
              style: slideTheme.heading,
            ),
            const SizedBox(height: 48),
            Text(
              'ビルドコマンドは非常にシンプルです：',
              style: slideTheme.body,
            ),
            const SizedBox(height: 36),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: materialTheme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'flutter build web --wasm',
                style: slideTheme.code,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
