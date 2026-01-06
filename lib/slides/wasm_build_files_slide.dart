import 'package:burikaigi2026_slide/theme/slide_dimensions.dart';
import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:burikaigi2026_slide/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

// スライド2: WASM判定フロー
class WasmBuildFilesFlowSlide extends FlutterDeckSlideWidget {
  const WasmBuildFilesFlowSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/wasm-build-files-flow',
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
          spacing: SlideDimensions.itemSpacing,
          children: [
            Text(
              'WASM判定フロー',
              style: slideTheme.heading,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // flutter.js
                  const InfoCard(
                    title: 'flutter.js',
                    subtitle: 'WASMサポート判定',
                    description: 'dart2wasmコンパイル、WasmGCを確認',
                    size: InfoCardSize.compact,
                  ),
                  const SizedBox(height: SlideDimensions.smallSpacing),
                  // 矢印
                  Icon(
                    Icons.arrow_downward,
                    color: colorScheme.primary,
                    size: 44,
                  ),
                  const SizedBox(height: SlideDimensions.smallSpacing),
                  // 分岐
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: SlideDimensions.cardPadding,
                      vertical: SlideDimensions.tinySpacing + 4,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer.withValues(alpha: 0.3),
                      borderRadius:
                          BorderRadius.circular(SlideDimensions.borderRadiusSmall),
                      border: Border.all(
                        color: colorScheme.primary,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      'WASMをサポートしているか',
                      style: slideTheme.body.copyWith(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: SlideDimensions.smallSpacing),
                  // 2つのパス
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: SlideDimensions.smallSpacing,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            // 矢印（左）
                            Icon(
                              Icons.check,
                              color: colorScheme.primary,
                              size: 44,
                            ),
                            const SizedBox(height: SlideDimensions.tinySpacing),
                            Text(
                              'TRUE',
                              style: slideTheme.body.copyWith(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: colorScheme.primary,
                              ),
                            ),
                            const SizedBox(height: SlideDimensions.tinySpacing),
                            const InfoCard(
                              title: 'main.dart.wasm',
                              subtitle: 'WASMビルドを読み込み',
                              description: '約1.9MB',
                              size: InfoCardSize.compact,
                              isHighlighted: true,
                              highlightIcon: Icons.star,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Icon(
                              Icons.close,
                              color: colorScheme.secondary,
                              size: 44,
                            ),
                            const SizedBox(height: SlideDimensions.tinySpacing),
                            Text(
                              'FALSE',
                              style: slideTheme.body.copyWith(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: colorScheme.secondary,
                              ),
                            ),
                            const SizedBox(height: SlideDimensions.tinySpacing),
                            const InfoCard(
                              title: 'main.dart.js',
                              subtitle: 'JSビルドを読み込み',
                              description: '約2.4MB',
                              size: InfoCardSize.compact,
                            ),
                          ],
                        ),
                      ),
                    ],
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
