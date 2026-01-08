import 'package:burikaigi2026_slide/theme/slide_dimensions.dart';
import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class MadeWithFlutterSlide extends FlutterDeckSlideWidget {
  const MadeWithFlutterSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/made-with-flutter',
          ),
        );

  @override
  Widget build(BuildContext context) {
    final theme = context.slideTextTheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(SlideDimensions.screenPadding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: SlideDimensions.sectionSpacing,
            children: [
              FlutterLogo(size: 120),
              Text(
                'このスライドも\nFlutter Webで作りました',
                style: theme.heading,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SlideDimensions.itemSpacing),
              Text(
                'flutter_deck パッケージを使用',
                style: theme.body,
              ),
              Text(
                'pub.dev/packages/flutter_deck',
                style: theme.code,
              ),
              SizedBox(height: SlideDimensions.itemSpacing),
              Text(
                'ソースコード',
                style: theme.body,
              ),
              Text(
                'github.com/dicenull/flutterweb_burikaigi2026',
                style: theme.code,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
