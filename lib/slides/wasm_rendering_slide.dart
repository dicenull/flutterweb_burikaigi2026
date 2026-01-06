import 'package:burikaigi2026_slide/theme/slide_dimensions.dart';
import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class WasmRenderingSlide extends FlutterDeckSlideWidget {
  const WasmRenderingSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/wasm-rendering',
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
              'WASM対応で変わるレンダリング',
              style: theme.heading,
            ),
            Text(
              'Flutter 3.22 以降でWASMビルドが正式対応！',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            Text(
              '従来のJavaScriptビルド（CanvasKit/SK Wasm） との違い',
              style: theme.body,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: SlideDimensions.screenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: SlideDimensions.sectionSpacing,
                children: [
                  Text(
                    'パフォーマンス向上: より滑らかなアニメーション',
                    style: theme.body.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'バイナリサイズ: 効率的な実行',
                    style: theme.body.copyWith(fontWeight: FontWeight.bold),
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
