import 'package:burikaigi2026_slide/slides/title_main_slide.dart';
import 'package:burikaigi2026_slide/slides/title_sub_slide.dart';
import 'package:burikaigi2026_slide/slides/title_wasm_slide.dart';
import 'package:burikaigi2026_slide/slides/toc_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(FlutterDeckApp(
    themeMode: ThemeMode.light,
    lightTheme: FlutterDeckThemeData.fromTheme(
      ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF042b59),
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.ibmPlexSansJpTextTheme(),
      ),
    ),
    configuration: FlutterDeckConfiguration(
      slideSize: FlutterDeckSlideSize.fromAspectRatio(
        aspectRatio: FlutterDeckAspectRatio.ratio16x9(),
      ),
      controls: FlutterDeckControlsConfiguration(
        shortcuts: FlutterDeckShortcutsConfiguration(
          enabled: true,
          nextSlide: SingleActivator(LogicalKeyboardKey.arrowRight),
          previousSlide: SingleActivator(LogicalKeyboardKey.arrowLeft),
        ),
      ),
      footer: FlutterDeckFooterConfiguration(
        showSlideNumbers: true,
      ),
      progressIndicator: FlutterDeckProgressIndicator.gradient(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
        ),
      ),
    ),
    slides: const [
      TitleMainSlide(),
      TitleSubSlide(),
      TitleWasmSlide(),
      TocSlide(),
    ],
  ));
}
