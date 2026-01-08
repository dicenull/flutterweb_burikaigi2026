import 'package:burikaigi2026_slide/theme/slide_dimensions.dart';
import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class SummarySlide extends FlutterDeckSlideWidget {
  const SummarySlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/summary',
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
              '学んだことのまとめ',
              style: theme.heading,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: SlideDimensions.itemSpacing,
                  children: [
                    Text(
                      'Flutter',
                      style: theme.body.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: SlideDimensions.screenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: SlideDimensions.tinySpacing,
                        children: [
                          Text(
                            '• マルチプラットフォーム対応でWebでも動く',
                            style: theme.body,
                          ),
                          Text(
                            '• 同じコードでiOS / Android / Web / Desktop',
                            style: theme.body,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'WebComponents',
                      style: theme.body.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: SlideDimensions.screenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: SlideDimensions.tinySpacing,
                        children: [
                          Text(
                            '• Flutter Webでできないことを補完',
                            style: theme.body,
                          ),
                          Text(
                            '• 既存のJS資産を再利用可能',
                            style: theme.body,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'WebAssembly (WASM)',
                      style: theme.body.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: SlideDimensions.screenPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: SlideDimensions.tinySpacing,
                        children: [
                          Text(
                            '• Flutter 3.22以降で正式対応 WebComponentsと併用は注意',
                            style: theme.body,
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
