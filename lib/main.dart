import 'package:burikaigi2026_slide/slides/demo_intro_slide.dart';
import 'package:burikaigi2026_slide/slides/flutter_demo_slide.dart';
import 'package:burikaigi2026_slide/slides/flutter_history_slide.dart';
import 'package:burikaigi2026_slide/slides/flutter_multiplatform_slide.dart';
import 'package:burikaigi2026_slide/slides/flutter_web_intro_slide.dart';
import 'package:burikaigi2026_slide/slides/flutter_web_pwa_slide.dart';
import 'package:burikaigi2026_slide/slides/flutter_web_ready_slide.dart';
import 'package:burikaigi2026_slide/slides/flutter_web_rendering_slide.dart';
import 'package:burikaigi2026_slide/slides/flutter_web_section_slide.dart';
import 'package:burikaigi2026_slide/slides/flutter_web_seo_slide.dart';
import 'package:burikaigi2026_slide/slides/made_with_flutter_slide.dart';
import 'package:burikaigi2026_slide/slides/riverpod_hooks_demo_slide.dart';
import 'package:burikaigi2026_slide/slides/riverpod_hooks_intro_slide.dart';
import 'package:burikaigi2026_slide/slides/self_introduction_slide.dart';
import 'package:burikaigi2026_slide/slides/summary_slide.dart';
import 'package:burikaigi2026_slide/slides/title_main_slide.dart';
import 'package:burikaigi2026_slide/slides/toc_slide.dart';
import 'package:burikaigi2026_slide/slides/ui_equals_f_state_explanation_slide.dart';
import 'package:burikaigi2026_slide/slides/ui_equals_f_state_slide.dart';
import 'package:burikaigi2026_slide/slides/wasm_build_files_slide.dart';
import 'package:burikaigi2026_slide/slides/wasm_build_slide.dart';
import 'package:burikaigi2026_slide/slides/wasm_rendering_slide.dart';
import 'package:burikaigi2026_slide/slides/wasm_section_slide.dart';
import 'package:burikaigi2026_slide/slides/wasm_webcomponents_warning_slide.dart';
import 'package:burikaigi2026_slide/slides/webcomponents_communication_slide.dart';
import 'package:burikaigi2026_slide/slides/webcomponents_display_slide.dart';
import 'package:burikaigi2026_slide/slides/webcomponents_embed_slide.dart';
import 'package:burikaigi2026_slide/slides/webcomponents_reference_slide.dart';
import 'package:burikaigi2026_slide/slides/webcomponents_register_slide.dart';
import 'package:burikaigi2026_slide/slides/webcomponents_section_slide.dart';
import 'package:burikaigi2026_slide/slides/what_is_flutter_slide.dart';
import 'package:burikaigi2026_slide/slides/why_webcomponents_slide.dart';
import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final materialTheme = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF042b59),
    ),
    useMaterial3: true,
  );

  final slideTextTheme = SlideTextTheme.defaultTheme.withFonts(
    sansFontFamily: GoogleFonts.ibmPlexSansJp().fontFamily,
    monoFontFamily: GoogleFonts.ibmPlexMono().fontFamily,
  );

  runApp(_SlideTextThemeProvider(
    theme: slideTextTheme,
    child: FlutterDeckApp(
      themeMode: ThemeMode.light,
      lightTheme: FlutterDeckThemeData.fromTheme(materialTheme),
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
        TocSlide(),
        SelfIntroductionSlide(),
        FlutterMultiplatformSlide(),
        WhatIsFlutterSlide(),
        FlutterHistorySlide(),
        UiEqualsFStateSlide(),
        UiEqualsFStateExplanationSlide(),
        DemoIntroSlide(),
        FlutterDemoSlide(),
        RiverpodHooksIntroSlide(),
        RiverpodHooksDemoSlide(),
        FlutterWebSectionSlide(),
        FlutterWebIntroSlide(),
        FlutterWebRenderingSlide(),
        FlutterWebRenderingConclusionSlide(),
        FlutterWebSeoSlide(),
        FlutterWebPwaSlide(),
        FlutterWebPwaServiceWorkerSlide(),
        FlutterWebReadySlide(),
        WebComponentsSectionSlide(),
        WhyWebComponentsSlide(),
        WebComponentsEmbedSlide(),
        WebComponentsRegisterSlide(),
        WebComponentsDisplaySlide(),
        WebComponentsCommunicationSlide(),
        WebComponentsReferenceSlide(),
        WasmSectionSlide(),
        WasmRenderingSlide(),
        WasmBuildSlide(),
        WasmBuildFilesFlowSlide(),
        WasmWebComponentsWarningSlide(),
        SummarySlide(),
        MadeWithFlutterSlide(),
      ],
    ),
  ));
}

class _SlideTextThemeProvider extends StatelessWidget {
  const _SlideTextThemeProvider({
    required this.theme,
    required this.child,
  });

  final SlideTextTheme theme;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SlideTextThemeInherited(
      theme: theme,
      child: child,
    );
  }
}
