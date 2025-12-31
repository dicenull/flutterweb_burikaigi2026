import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class FlutterHistorySlide extends FlutterDeckSlideWidget {
  const FlutterHistorySlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-history',
          ),
        );

  @override
  Widget build(BuildContext context) {
    final theme = context.slideTextTheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Flutterの歴史',
              style: theme.heading,
            ),
            const SizedBox(height: 48),
            Text(
              '2018年: Flutter 1.0 Android / iOS Stable',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Text(
              '2021年: Flutter 2.0 Web Stable',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Text(
              '2022年: Flutter 3.0 Desktop Stable',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 36),
            Text(
              '2026年現在、主要プラットフォームをカバー',
              style: theme.body,
            ),
          ],
        ),
      ),
    );
  }
}
