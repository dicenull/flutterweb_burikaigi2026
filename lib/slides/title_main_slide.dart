import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class TitleMainSlide extends FlutterDeckSlideWidget {
  const TitleMainSlide({super.key})
      : super(
          configuration:
              const FlutterDeckSlideConfiguration(route: '/title-main'),
        );

  @override
  Widget build(BuildContext context) {
    final theme = context.slideTextTheme;

    return FlutterDeckSlide.blank(
      footerBuilder: (context) {
        return Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            spacing: 32,
            children: [
              Text(
                'burikaigi 2026',
                style: theme.body,
              ),
              Text(
                'ダイス @dicenull',
                style: theme.body,
              ),
            ],
          ),
        );
      },
      builder: (context) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 32.0,
          children: [
            Text(
              'Flutter Web入門',
              style: theme.title,
              textAlign: TextAlign.center,
            ),
            Text(
              'マルチプラットフォーム開発からWebAssemblyまで',
              style: theme.subtitle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
