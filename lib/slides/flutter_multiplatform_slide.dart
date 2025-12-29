import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class FlutterMultiplatformSlide extends FlutterDeckSlideWidget {
  const FlutterMultiplatformSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-multiplatform',
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.title(
      title: '1. Flutter マルチプラットフォーム',
    );
  }
}

