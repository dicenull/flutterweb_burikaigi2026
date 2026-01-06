import 'package:burikaigi2026_slide/widgets/section_slide.dart';
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
    return FlutterDeckSlide.blank(
      builder: (context) => const SectionSlideContent(
        title: '3. WebAssembly (WASM) の話',
      ),
    );
  }
}
