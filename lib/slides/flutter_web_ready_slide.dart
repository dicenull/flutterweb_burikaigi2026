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
    final theme = Theme.of(context);
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Flutter WebってプロダクトReadyなの？',
              style: theme.textTheme.displayMedium,
            ),
            const SizedBox(height: 32),
            Text(
              '結論：弊社ではフル活用しています！',
              style: theme.textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              '事例: 「ふわっち」のモバイルWeb版',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                '視聴・配信機能の両方をFlutter Webで構築',
                style: theme.textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'メリット: モバイルアプリに近い体験をWebで提供可能',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              '本日のメイン: その中で見えてきた「既存資産」や「最新技術」との付き合い方',
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

