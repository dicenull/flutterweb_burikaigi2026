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
    final theme = Theme.of(context);
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Flutterの歴史',
              style: theme.textTheme.displayMedium,
            ),
            const SizedBox(height: 32),
            Text(
              '2018年: Dart 2.0 / Flutter 1.0 リリース（モバイル中心）',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '2021年: Flutter 2.0 Web Stable',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '2022年: Flutter 3.0 Desktop Stable',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              '2026年現在、主要プラットフォームをカバー',
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

