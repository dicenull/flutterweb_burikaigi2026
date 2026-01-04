import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class FlutterWebIntroSlide extends FlutterDeckSlideWidget {
  const FlutterWebIntroSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-web-intro',
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
              'Flutter Web',
              style: theme.heading,
            ),
            Text(
              'マルチプラットフォーム対応なので、Webでも動く',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 32.0,
                children: [
                  Text(
                    '同じコードでiOS / Android / Web / Desktop',
                    style: theme.body,
                  ),
                  Text(
                    'プラットフォーム間でUIの一貫性を保てる',
                    style: theme.body,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 48),
            Text('他にも、', style: theme.body),
            Text(
              'WebComponentsで既存のJS資産を活用',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              'WebAssembly (WASM) でパフォーマンス向上',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
