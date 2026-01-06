import 'package:burikaigi2026_slide/theme/slide_dimensions.dart';
import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

// スライド1: 連携概要
class WebComponentsEmbedSlide extends FlutterDeckSlideWidget {
  const WebComponentsEmbedSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/webcomponents-embed',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: SlideDimensions.sectionSpacing,
          children: [
            Text(
              'Web Componentsとの連携',
              style: slideTheme.heading,
            ),
            Text(
              'Flutter WebでWeb Componentsを埋め込む方法',
              style: slideTheme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: SlideDimensions.itemSpacing - 4,
                  children: [
                    Text(
                      '手順',
                      style:
                          slideTheme.body.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: SlideDimensions.screenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: SlideDimensions.smallSpacing,
                        children: [
                          Text(
                            '1. PlatformViewRegistryでWeb Componentを登録',
                            style: slideTheme.body,
                          ),
                          Text(
                            '2. HtmlElementViewでWidget Tree内に配置',
                            style: slideTheme.body,
                          ),
                          Text(
                            '3. イベントやプロパティで双方向通信',
                            style: slideTheme.body,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: SlideDimensions.smallSpacing),
                    Container(
                      padding: const EdgeInsets.all(SlideDimensions.cardPadding),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(
                            SlideDimensions.borderRadiusSmall),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: SlideDimensions.tinySpacing + 4,
                        children: [
                          Text(
                            'メリット',
                            style: slideTheme.body.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: SlideDimensions.cardPadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: SlideDimensions.tinySpacing + 4,
                              children: [
                                Text(
                                  '• FlutterのWidget Tree内に配置可能',
                                  style: slideTheme.body,
                                ),
                                Text(
                                  '• 既存のJS資産を再利用',
                                  style: slideTheme.body,
                                ),
                                Text(
                                  '• 双方向通信も可能',
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
            ),
          ],
        ),
      ),
    );
  }
}
