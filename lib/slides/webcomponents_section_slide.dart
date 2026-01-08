import 'package:burikaigi2026_slide/widgets/section_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class WebComponentsSectionSlide extends FlutterDeckSlideWidget {
  const WebComponentsSectionSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/webcomponents-section',
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const SectionSlideContent(
        title: 'WebComponentsとFlutter',
      ),
    );
  }
}
