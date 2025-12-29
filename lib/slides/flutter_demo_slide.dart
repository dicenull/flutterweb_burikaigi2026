import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';

class FlutterDemoSlide extends FlutterDeckSlideWidget {
  const FlutterDemoSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-demo',
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
              '【Demo】Flutterの基本',
              style: theme.textTheme.displayMedium,
            ),
            const SizedBox(height: 32),
            Text(
              'DartPad を使ったカウンターコードの紹介',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Widget Tree の構造：',
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                'Scaffold > AppBar / Center > Column > Text',
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontFamily: GoogleFonts.ibmPlexMono().fontFamily,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'ボタンを押すと setState() で画面が更新される仕組みを体感',
              style: theme.textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
