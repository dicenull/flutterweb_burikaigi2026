import 'package:burikaigi2026_slide/theme/slide_dimensions.dart';
import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class TocSlide extends FlutterDeckSlideWidget {
  const TocSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(route: '/toc'),
        );

  @override
  Widget build(BuildContext context) {
    final theme = context.slideTextTheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(SlideDimensions.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: SlideDimensions.smallSpacing,
          children: [
            Text(
              '目次',
              style: theme.title,
            ),
            ...[
              'Flutterとは',
              'Flutter Webとは',
              'WebComponentsとFlutter',
              'WebAssembly (WASM)とFlutter',
              'まとめ'
            ].asMap().entries.map(
                  (entry) => Padding(
                    padding:
                        const EdgeInsets.only(bottom: SlideDimensions.itemSpacing),
                    child: Text(
                      '${entry.key + 1}. ${entry.value}',
                      style: theme.tocItem,
                    ),
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
