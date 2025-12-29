import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class WhatIsFlutterSlide extends FlutterDeckSlideWidget {
  const WhatIsFlutterSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/what-is-flutter',
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
              'Flutterとは',
              style: theme.textTheme.displayMedium,
            ),
            const SizedBox(height: 32),
            Text(
              'Google製のUIフレームワーク',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '言語: Dart',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '特徴: マルチプラットフォーム対応',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                '1つのプロジェクトでiOS / Android / Web / Desktopに対応',
                style: theme.textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'UIの仕組み: すべてが Widget',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'プラットフォームごとのUI差分なし',
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'パッケージ（pub.dev）が複数のプラットフォームをサポート',
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

