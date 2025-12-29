import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';

class UiEqualsFStateSlide extends FlutterDeckSlideWidget {
  const UiEqualsFStateSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/ui-equals-f-state',
          ),
        );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return FlutterDeckSlide.blank(
      builder: (context) => Center(
        child: Text(
          'UI = f(state)',
          style: theme.textTheme.displayLarge?.copyWith(
            fontFamily: GoogleFonts.ibmPlexMono().fontFamily,
          ),
        ),
      ),
    );
  }
}

