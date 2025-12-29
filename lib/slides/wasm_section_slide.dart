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
    return FlutterDeckSlide.title(
      title: '3. WebAssembly (WASM) の話',
    );
  }
}

