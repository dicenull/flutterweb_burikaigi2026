import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
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
    final theme = context.slideTextTheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Center(
        child: Text(
          '1. Flutter マルチプラットフォーム',
          style: theme.sectionTitle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

