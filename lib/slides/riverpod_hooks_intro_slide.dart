import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class RiverpodHooksIntroSlide extends FlutterDeckSlideWidget {
  const RiverpodHooksIntroSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/riverpod-hooks-intro',
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
              'パッケージ (pub.dev)で拡張できる',
              style: theme.heading,
            ),
            Text(
              '便利なパッケージがたくさん',
              style: theme.body,
            ),
            Text(
              'マルチプラットフォームに対応したパッケージが多い',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 48),
            Text(
              'Riverpod × HooksでReactっぽく書ける',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 32.0,
                children: [
                  Text(
                    '状態管理がシンプル',
                    style: theme.body,
                  ),
                  Text(
                    '関数型コンポーネント風',
                    style: theme.body,
                  ),
                  Text(
                    'React経験者にも馴染みやすい',
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
