import 'package:burikaigi2026_slide/theme/slide_dimensions.dart';
import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class SelfIntroductionSlide extends FlutterDeckSlideWidget {
  const SelfIntroductionSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/self-introduction',
          ),
        );

  @override
  Widget build(BuildContext context) {
    final theme = context.slideTextTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final labelStyle = theme.body.copyWith(
      color: colorScheme.onSurface.withValues(alpha: 0.6),
    );
    return FlutterDeckSlide.blank(
      builder: (context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(SlideDimensions.screenPadding),
          child: Row(
            children: [
              Image.asset('assets/images/icon.png'),
              const SizedBox(width: SlideDimensions.screenPadding),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '自己紹介',
                        style: theme.title,
                      ),
                      const TextSpan(text: '\n'),
                      TextSpan(
                        text: '名前:',
                        style: labelStyle,
                      ),
                      TextSpan(
                        text: ' 早坂太吾 / @dicenull',
                        style: theme.body,
                      ),
                      const TextSpan(text: '\n'),
                      TextSpan(
                        text: '所属:',
                        style: labelStyle,
                      ),
                      TextSpan(
                        text: ' 株式会社jig.jp',
                        style: theme.body,
                      ),
                      const TextSpan(text: '\n'),
                      TextSpan(
                        text: 'Flutterとの関わり:',
                        style: labelStyle,
                      ),
                      TextSpan(
                        text: ' 2020年新卒入社から',
                        style: theme.body,
                      ),
                      const TextSpan(text: '\n'),
                      TextSpan(
                        text: 'Burikaigiとの関わり:',
                        style: labelStyle,
                      ),
                      TextSpan(
                        text: ' 昨年初参加、今年初登壇します！',
                        style: theme.body,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
