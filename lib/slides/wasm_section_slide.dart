import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class WasmSectionSlide extends FlutterDeckSlideWidget {
  const WasmSectionSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/wasm-section',
          ),
        );

  @override
  Widget build(BuildContext context) {
    final theme = context.slideTextTheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Center(
        child: Text(
          '3. WebAssembly (WASM) の話',
          style: theme.sectionTitle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
