import 'package:burikaigi2026_slide/theme/slide_dimensions.dart';
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
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(SlideDimensions.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: SlideDimensions.sectionSpacing,
          children: [
            Text(
              'WASMビルドを試す',
              style: slideTheme.heading,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: SlideDimensions.itemSpacing,
                  children: [
                    Text(
                      'ビルドはシンプル',
                      style: slideTheme.body.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SimpleCodeBlock(
                      text: 'flutter build web --wasm',
                    ),
                    const SizedBox(height: SlideDimensions.smallSpacing),
                    Text(
                      'ビルド後のファイル',
                      style: slideTheme.body.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: SlideDimensions.screenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: SlideDimensions.tinySpacing + 4,
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
