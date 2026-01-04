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
        padding: const EdgeInsets.all(48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 32.0,
          children: [
            Text(
              'WASMビルドを試す',
              style: slideTheme.heading,
            ),
            Text(
              'ビルドコマンドは非常にシンプルです：',
              style: slideTheme.body,
            ),
            const SimpleCodeBlock(
              text: 'flutter build web --wasm',
            ),
          ],
        ),
      ),
    );
  }
}
