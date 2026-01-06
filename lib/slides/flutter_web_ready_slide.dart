import 'package:burikaigi2026_slide/theme/slide_dimensions.dart';
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
    final colorScheme = Theme.of(context).colorScheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(SlideDimensions.screenPadding),
        child: Row(
          children: [
            // 左側: テキスト
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: SlideDimensions.itemSpacing,
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
                    padding: const EdgeInsets.only(
                        left: SlideDimensions.screenPadding),
                    child: Text(
                      '視聴・配信機能を構築',
                      style: theme.body,
                    ),
                  ),
                  Text(
                    'モバイルアプリのコードを活用',
                    style: theme.body.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'WebComponentsも活用',
                    style: theme.body.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: SlideDimensions.screenPadding),
                    child: Text(
                      '既存のJS資産をFlutter Webに統合',
                      style: theme.body,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: SlideDimensions.itemSpacing),
            // 右側: 画像
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.all(SlideDimensions.cardPadding),
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius:
                      BorderRadius.circular(SlideDimensions.borderRadiusSmall),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.shadow.withValues(alpha: 0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: SlideDimensions.smallSpacing,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: colorScheme.outline.withValues(alpha: SlideDimensions.alphaHigh),
                            width: SlideDimensions.borderWidthNormal,
                          ),
                          borderRadius:
                      BorderRadius.circular(SlideDimensions.borderRadiusSmall),
                        ),
                        child: ClipRRect(
                          borderRadius:
                      BorderRadius.circular(SlideDimensions.borderRadiusSmall),
                          child: Image.asset(
                            'assets/images/app_whowatch_tv_home.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: colorScheme.outline.withValues(alpha: SlideDimensions.alphaHigh),
                            width: SlideDimensions.borderWidthNormal,
                          ),
                          borderRadius:
                      BorderRadius.circular(SlideDimensions.borderRadiusSmall),
                        ),
                        child: ClipRRect(
                          borderRadius:
                      BorderRadius.circular(SlideDimensions.borderRadiusSmall),
                          child: Image.asset(
                            'assets/images/app_whowatch_tv_live.png',
                            fit: BoxFit.contain,
                          ),
                        ),
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
