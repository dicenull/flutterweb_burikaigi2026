import 'package:burikaigi2026_slide/theme/slide_dimensions.dart';
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
        padding: const EdgeInsets.all(SlideDimensions.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: SlideDimensions.sectionSpacing,
          children: [
            Text(
              'パッケージ (pub.dev)',
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
            const SizedBox(height: SlideDimensions.screenPadding),
            Text(
              '例: Riverpod × HooksパッケージでReactっぽく',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: SlideDimensions.screenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: SlideDimensions.sectionSpacing,
                children: [
                  Text(
                    '状態管理がシンプル',
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
