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
    return FlutterDeckSlide.blank(
      builder: (context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(48),
          child: Row(
            children: [
              Image.asset('assets/images/icon.png'),
              const SizedBox(width: 48),
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: '自己紹介\n',
                        style: theme.title,
                      ),
                      const TextSpan(text: '\n'),
                      TextSpan(
                        text: '名前: 早坂太吾 / @dicenull\n',
                        style: theme.body,
                      ),
                      const TextSpan(text: '\n'),
                      TextSpan(
                        text: '所属: 株式会社jig.jp\n',
                        style: theme.body,
                      ),
                      const TextSpan(text: '\n'),
                      TextSpan(
                        text: 'Flutterとの関わり:\n2020年新卒入社からFlutterを使っています\n',
                        style: theme.body,
                      ),
                      const TextSpan(text: '\n'),
                      TextSpan(
                        text: 'Burikaigiとの関わり:\n昨年はじめて参加、今年はじめて登壇します！',
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
