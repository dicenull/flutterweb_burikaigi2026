import 'package:burikaigi2026_slide/theme/slide_dimensions.dart';
import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class WasmWebComponentsWarningSlide extends FlutterDeckSlideWidget {
  const WasmWebComponentsWarningSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/wasm-webcomponents-warning',
          ),
        );

  @override
  Widget build(BuildContext context) {
    final theme = context.slideTextTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(SlideDimensions.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: SlideDimensions.sectionSpacing,
          children: [
            Text(
              'WASMとWebComponentsの併用時の注意',
              style: theme.heading,
            ),
            Text(
              'WebComponentsがWidgetの後ろに隠れてしまう',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: SlideDimensions.screenPadding),
              child: Text(
                '• https://github.com/flutter/flutter/issues/166357',
                style: theme.body,
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: colorScheme.outline
                          .withValues(alpha: SlideDimensions.alphaHigh),
                      width: SlideDimensions.borderWidthNormal,
                    ),
                    borderRadius: BorderRadius.circular(
                        SlideDimensions.borderRadiusSmall),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                        SlideDimensions.borderRadiusSmall),
                    child: Image.asset(
                      'assets/images/wasm_webcomponents_issue.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
