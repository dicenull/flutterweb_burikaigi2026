import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class WhyWebComponentsSlide extends FlutterDeckSlideWidget {
  const WhyWebComponentsSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/why-webcomponents',
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
          spacing: 32.0,
          children: [
            Text(
              'WebComponents (WC) を使う理由',
              style: theme.heading,
            ),
            Text(
              'Flutter Webでできないことを補完する',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 32.0,
                children: [
                  Text(
                    'Flutter側でまだサポートされていないブラウザ固有の技術を使いたい',
                    style: theme.body,
                  ),
                  Text(
                    '既存のJS資産（チャットUI、特殊なプレイヤー等）を再利用したい',
                    style: theme.body,
                  ),
                ],
              ),
            ),
            Text(
              'WCの作り方:',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 32.0,
                children: [
                  Text(
                    'ピュアなHTML/CSS/JSで構築',
                    style: theme.body,
                  ),
                  Text(
                    'Angularなどのフレームワークから書き出し',
                    style: theme.body,
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
