import 'package:burikaigi2026_slide/theme/slide_dimensions.dart';
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
        padding: const EdgeInsets.all(SlideDimensions.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: SlideDimensions.sectionSpacing,
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
              padding:
                  const EdgeInsets.only(left: SlideDimensions.screenPadding),
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
              padding:
                  const EdgeInsets.only(left: SlideDimensions.screenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: SlideDimensions.sectionSpacing,
                children: [
                  Text(
                    'プラットフォームごとのUI差分なし',
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
