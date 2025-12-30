import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class FlutterDemoSlide extends FlutterDeckSlideWidget {
  const FlutterDemoSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-demo',
          ),
        );

  @override
  Widget build(BuildContext context) {
    final theme = context.slideTextTheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '【Demo】Flutterの基本',
              style: theme.heading,
            ),
            const SizedBox(height: 48),
            Text(
              'DartPad を使ったカウンターコードの紹介',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 36),
            Text(
              'Widget Tree の構造：',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Text(
                'Scaffold > AppBar / Center > Column > Text',
                style: theme.code,
              ),
            ),
            const SizedBox(height: 36),
            Text(
              'ボタンを押すと setState() で画面が更新される仕組みを体感',
              style: theme.body,
            ),
          ],
        ),
      ),
    );
  }
}
