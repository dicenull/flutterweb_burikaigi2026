import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class WebComponentsEmbedSlide extends FlutterDeckSlideWidget {
  const WebComponentsEmbedSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/webcomponents-embed',
          ),
        );

  @override
  Widget build(BuildContext context) {
    final materialTheme = Theme.of(context);
    final slideTheme = context.slideTextTheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Flutter Webへの埋め込み',
              style: slideTheme.heading,
            ),
            const SizedBox(height: 48),
            Text(
              'HtmlElementView を利用して、FlutterのWidget Tree内にWCを配置',
              style: slideTheme.body,
            ),
            const SizedBox(height: 36),
            Text(
              '詳細は弊社のエンジニアブログ（Zenn）で公開中！',
              style: slideTheme.body,
            ),
            const SizedBox(height: 48),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: materialTheme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '参考記事:',
                    style: slideTheme.body.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Flutter WebでWeb Componentsを活用する',
                    style: slideTheme.body,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'https://zenn.dev/jigjp_engineer/articles/cc7fbc31d045d',
                    style: slideTheme.code.copyWith(
                      fontSize: 48,
                      color: materialTheme.colorScheme.primary,
                    ),
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

