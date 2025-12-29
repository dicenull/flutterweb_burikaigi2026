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
    final theme = Theme.of(context);
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'WASM対応で変わるレンダリング',
              style: theme.textTheme.displayMedium,
            ),
            const SizedBox(height: 32),
            Text(
              'Flutter 3.22 以降でWASMビルドが正式対応！',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              '従来のJavaScriptビルド（CanvasKit/SKWA）との違い',
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'パフォーマンス向上: より滑らかなアニメーション',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'バイナリサイズ: 効率的な実行',
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
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

