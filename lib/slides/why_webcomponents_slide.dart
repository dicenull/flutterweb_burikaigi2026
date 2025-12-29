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
    final theme = Theme.of(context);
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'なぜWebComponents (WC) を使うのか？',
              style: theme.textTheme.displayMedium,
            ),
            const SizedBox(height: 32),
            Text(
              'Flutter Webでできないことを補完する',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Flutter側でまだサポートされていないブラウザ固有の技術を使いたい',
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '既存のJS資産（チャットUI、特殊なプレイヤー等）を再利用したい',
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'WCの作り方:',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ピュアなHTML/CSS/JSで構築',
                    style: theme.textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Angularなどのフレームワークから書き出し',
                    style: theme.textTheme.bodyLarge,
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

