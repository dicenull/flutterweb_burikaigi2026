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
          spacing: 32.0,
          children: [
            Text(
              'Flutterとは',
              style: theme.heading,
            ),
            Text(
              'Google製のUIフレームワーク',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              '言語: Dart',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              '特徴: マルチプラットフォーム対応',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Text(
                '1つのプロジェクトでiOS / Android / Web / Desktopに対応',
                style: theme.body,
              ),
            ),
            Text(
              'UIの仕組み: すべてが Widget',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 32.0,
                children: [
                  Text(
                    'プラットフォームごとのUI差分なし',
                    style: theme.body,
                  ),
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

