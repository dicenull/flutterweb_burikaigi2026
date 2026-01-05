import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:burikaigi2026_slide/widgets/code_block.dart';
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
    final slideTheme = context.slideTextTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 32.0,
          children: [
            Text(
              'WASMビルドを試す',
              style: slideTheme.heading,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 24.0,
                  children: [
                    Text(
                      'ビルド',
                      style: slideTheme.body.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SimpleCodeBlock(
                      text: 'flutter build web --wasm',
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'ビルド後のファイル',
                      style: slideTheme.body.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 48),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 12.0,
                        children: [
                          Text(
                            '• main.dart.js: Dartコード（JavaScript）',
                            style: slideTheme.body,
                          ),
                          Text(
                            '• main.dart.wasm: Dartコード（WebAssembly）',
                            style: slideTheme.body,
                          ),
                          Text(
                            '• flutter.js: Flutterフレームワーク',
                            style: slideTheme.body,
                          ),
                        ],
                      ),
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
