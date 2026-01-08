import 'package:burikaigi2026_slide/theme/slide_dimensions.dart';
import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:web/web.dart' as web;

class WebComponentsReferenceSlide extends FlutterDeckSlideWidget {
  const WebComponentsReferenceSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/webcomponents-reference',
          ),
        );

  @override
  Widget build(BuildContext context) {
    final slideTheme = context.slideTextTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(SlideDimensions.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: SlideDimensions.sectionSpacing,
          children: [
            Text(
              '詳細はZennの記事をご覧ください',
              style: slideTheme.heading,
            ),
            const SizedBox(height: SlideDimensions.itemSpacing),
            Container(
              padding: const EdgeInsets.all(SlideDimensions.sectionSpacing),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHighest,
                borderRadius:
                    BorderRadius.circular(SlideDimensions.borderRadiusLarge),
                border: Border.all(
                  color: colorScheme.primary,
                  width: SlideDimensions.borderWidthHighlight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: SlideDimensions.smallSpacing,
                children: [
                  Text(
                    '🤝 Flutter Webからウェブコンポーネントを使う',
                    style: slideTheme.body.copyWith(
                      fontSize: 48,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: SlideDimensions.smallSpacing),
                  GestureDetector(
                    onTap: () {
                      if (kIsWeb) {
                        web.window.open(
                          'https://zenn.dev/jigjp_engineer/articles/cc7fbc31d045d2',
                          '_blank',
                        );
                      }
                    },
                    child: Text(
                      'https://zenn.dev/jigjp_engineer/articles/cc7fbc31d045d2',
                      style: slideTheme.body.copyWith(
                        fontSize: 36,
                        color: colorScheme.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  const SizedBox(height: SlideDimensions.itemSpacing),
                  Container(
                    padding: const EdgeInsets.all(SlideDimensions.smallSpacing),
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(
                          SlideDimensions.borderRadiusSmall),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: SlideDimensions.tinySpacing + 4,
                      children: [
                        Text(
                          '記事の内容',
                          style: slideTheme.body.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: SlideDimensions.cardPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: SlideDimensions.tinySpacing,
                            children: [
                              Text(
                                '• WebComponentsの基本概念',
                                style: slideTheme.body,
                              ),
                              Text(
                                '• Flutter Webでの実装方法',
                                style: slideTheme.body,
                              ),
                              Text(
                                '• 双方向通信の実装例',
                                style: slideTheme.body,
                              ),
                            ],
                          ),
                        ),
                      ],
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
