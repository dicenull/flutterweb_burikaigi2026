import 'package:burikaigi2026_slide/widgets/section_slide.dart';
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
    return FlutterDeckSlide.blank(
      builder: (context) => const SectionSlideContent(
        title: '1. Flutter マルチプラットフォーム',
      ),
    );
  }
}

