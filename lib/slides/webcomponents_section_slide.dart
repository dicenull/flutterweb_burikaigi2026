import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
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
    final theme = context.slideTextTheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Center(
        child: Text(
          '2. WebComponentsの活用',
          style: theme.sectionTitle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

