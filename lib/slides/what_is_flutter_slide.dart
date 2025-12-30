import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
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
    final theme = context.slideTextTheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Flutterとは',
              style: theme.heading,
            ),
            const SizedBox(height: 48),
            Text(
              'Google製のUIフレームワーク',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Text(
              '言語: Dart',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Text(
              '特徴: マルチプラットフォーム対応',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Text(
                '1つのプロジェクトでiOS / Android / Web / Desktopに対応',
                style: theme.body,
              ),
            ),
            const SizedBox(height: 36),
            Text(
              'UIの仕組み: すべてが Widget',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'プラットフォームごとのUI差分なし',
                    style: theme.body,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'パッケージ（pub.dev）が複数のプラットフォームをサポート',
                    style: theme.body,
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

