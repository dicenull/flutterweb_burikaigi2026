import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class FlutterWebPwaSlide extends FlutterDeckSlideWidget {
  const FlutterWebPwaSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-web-pwa',
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
              'Flutter WebとPWA',
              style: theme.heading,
            ),
            Text(
              'Progressive Web Appとして動作',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 32.0,
                children: [
                  Text(
                    'オフライン対応',
                    style: theme.body,
                  ),
                  Text(
                    'ホーム画面に追加可能',
                    style: theme.body,
                  ),
                  Text(
                    'アプリのような体験',
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

class FlutterWebPwaServiceWorkerSlide extends FlutterDeckSlideWidget {
  const FlutterWebPwaServiceWorkerSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-web-pwa-service-worker',
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
              'Service Worker対応',
              style: theme.heading,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 32.0,
                children: [
                  Text(
                    'キャッシュ戦略の実装',
                    style: theme.body,
                  ),
                  Text(
                    'バックグラウンド処理',
                    style: theme.body,
                  ),
                  Text(
                    'プッシュ通知も可能',
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

