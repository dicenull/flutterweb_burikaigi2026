import 'package:burikaigi2026_slide/widgets/section_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class FlutterWebSectionSlide extends FlutterDeckSlideWidget {
  const FlutterWebSectionSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-web-section',
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const SectionSlideContent(
        title: '2. Flutter Webの基本',
      ),
    );
  }
}
