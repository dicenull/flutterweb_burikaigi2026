import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';

class WasmBuildSlide extends FlutterDeckSlideWidget {
  const WasmBuildSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/wasm-build',
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
              'WASMビルドを試す',
              style: theme.textTheme.displayMedium,
            ),
            const SizedBox(height: 32),
            Text(
              'ビルドコマンドは非常にシンプルです：',
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                'flutter build web --wasm',
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontFamily: GoogleFonts.ibmPlexMono().fontFamily,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

