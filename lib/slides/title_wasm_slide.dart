import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class TitleWasmSlide extends FlutterDeckSlideWidget {
  const TitleWasmSlide({super.key})
      : super(
          configuration:
              const FlutterDeckSlideConfiguration(route: '/title-wasm'),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.title(
      title: 'WebAssemblyまで',
    );
  }
}

