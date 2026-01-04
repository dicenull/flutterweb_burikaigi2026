import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class FlutterWebReadySlide extends FlutterDeckSlideWidget {
  const FlutterWebReadySlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-web-ready',
          ),
        );

  @override
  Widget build(BuildContext context) {
    final theme = context.slideTextTheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 32,
              children: [
                Text(
                  'Flutter Web活用事例',
                  style: theme.heading,
                ),
                Text(
                  '「ふわっち」のモバイルWeb',
                  style: theme.body.copyWith(fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 48),
                  child: Text(
                    '視聴・配信機能を構築',
                    style: theme.body,
                  ),
                ),
                Text(
                  'モバイルアプリのコードを活用して、同じ体験を届けられる',
                  style: theme.body.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Center(
              child: Text('今日はそんなFlutter Webを紹介します！', style: theme.heading),
            )
          ],
        ),
      ),
    );
  }
}
