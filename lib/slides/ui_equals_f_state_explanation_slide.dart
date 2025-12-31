import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class UiEqualsFStateExplanationSlide extends FlutterDeckSlideWidget {
  const UiEqualsFStateExplanationSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/ui-equals-f-state-explanation',
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
              'UI = f(state) ',
              style: theme.heading,
            ),
            const SizedBox(height: 48),
            Text(
              'UIは状態（state）の関数',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '同じ状態なら、常に同じUIが表示される',
                    style: theme.body,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '状態が変わると、UIが自動的に更新される',
                    style: theme.body,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '予測可能で、デバッグしやすい',
                    style: theme.body,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 36),
            Text(
              '宣言的UI（Declarative UI）',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '「何を」表示するかを記述する',
                    style: theme.body,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Text(
                '状態が変わると、UIが更新される',
                style: theme.body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
