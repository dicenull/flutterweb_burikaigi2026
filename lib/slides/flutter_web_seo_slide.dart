import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class FlutterWebSeoSlide extends FlutterDeckSlideWidget {
  const FlutterWebSeoSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-web-seo',
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
              'Flutter WebとSEO',
              style: theme.heading,
            ),
            Text(
              'HTMLレンダリングモードでSEO対応',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 32.0,
                children: [
                  Text(
                    'DOM要素として直接レンダリングされる',
                    style: theme.body,
                  ),
                  Text(
                    '検索エンジンがコンテンツを認識可能',
                    style: theme.body,
                  ),
                  Text(
                    'メタタグやOGPタグも設定可能',
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

class FlutterWebSeoSsrSlide extends FlutterDeckSlideWidget {
  const FlutterWebSeoSsrSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-web-seo-ssr',
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
              'サーバーサイドレンダリング（SSR）',
              style: theme.heading,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 32.0,
                children: [
                  Text(
                    '初期表示の高速化',
                    style: theme.body,
                  ),
                  Text(
                    'より良いSEO対応',
                    style: theme.body,
                  ),
                  Text(
                    'Flutter WebでもSSRの可能性',
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

