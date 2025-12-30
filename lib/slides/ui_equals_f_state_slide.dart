import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class UiEqualsFStateSlide extends FlutterDeckSlideWidget {
  const UiEqualsFStateSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/ui-equals-f-state',
          ),
        );

  @override
  Widget build(BuildContext context) {
    final theme = context.slideTextTheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Center(
        child: Text(
          'UI = f(state)',
          style: theme.code.copyWith(
            fontSize: 200,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

