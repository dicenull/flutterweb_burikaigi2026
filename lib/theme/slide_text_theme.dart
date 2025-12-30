import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SlideTextTheme {
  const SlideTextTheme({
    required this.title,
    required this.subtitle,
    required this.sectionTitle,
    required this.heading,
    required this.body,
    required this.code,
    required this.tocItem,
  });

  final TextStyle title;
  final TextStyle subtitle;
  final TextStyle sectionTitle;
  final TextStyle heading;
  final TextStyle body;
  final TextStyle code;
  final TextStyle tocItem;

  static const SlideTextTheme defaultTheme = SlideTextTheme(
    title: TextStyle(
      fontSize: 120,
      fontWeight: FontWeight.bold,
    ),
    subtitle: TextStyle(
      fontSize: 96,
      fontWeight: FontWeight.w400,
    ),
    sectionTitle: TextStyle(
      fontSize: 120,
      fontWeight: FontWeight.bold,
    ),
    heading: TextStyle(
      fontSize: 100,
      fontWeight: FontWeight.bold,
    ),
    body: TextStyle(
      fontSize: 64,
      fontWeight: FontWeight.w400,
    ),
    code: TextStyle(
      fontSize: 64,
      fontWeight: FontWeight.w400,
    ),
    tocItem: TextStyle(
      fontSize: 80,
      fontWeight: FontWeight.w500,
    ),
  );

  SlideTextTheme withFonts({
    String? sansFontFamily,
    String? monoFontFamily,
  }) {
    return SlideTextTheme(
      title: title.copyWith(
        fontFamily: sansFontFamily ?? GoogleFonts.ibmPlexSansJp().fontFamily,
      ),
      subtitle: subtitle.copyWith(
        fontFamily: sansFontFamily ?? GoogleFonts.ibmPlexSansJp().fontFamily,
      ),
      sectionTitle: sectionTitle.copyWith(
        fontFamily: sansFontFamily ?? GoogleFonts.ibmPlexSansJp().fontFamily,
      ),
      heading: heading.copyWith(
        fontFamily: sansFontFamily ?? GoogleFonts.ibmPlexSansJp().fontFamily,
      ),
      body: body.copyWith(
        fontFamily: sansFontFamily ?? GoogleFonts.ibmPlexSansJp().fontFamily,
      ),
      code: code.copyWith(
        fontFamily: monoFontFamily ?? GoogleFonts.ibmPlexMono().fontFamily,
      ),
      tocItem: tocItem.copyWith(
        fontFamily: sansFontFamily ?? GoogleFonts.ibmPlexSansJp().fontFamily,
      ),
    );
  }
}

extension SlideTextThemeExtension on BuildContext {
  SlideTextTheme get slideTextTheme {
    return SlideTextThemeInherited.of(this)?.theme ??
        SlideTextTheme.defaultTheme.withFonts();
  }
}

class SlideTextThemeInherited extends InheritedWidget {
  const SlideTextThemeInherited({
    super.key,
    required this.theme,
    required super.child,
  });

  final SlideTextTheme theme;

  static SlideTextThemeInherited? of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SlideTextThemeInherited>();
  }

  @override
  bool updateShouldNotify(SlideTextThemeInherited oldWidget) {
    return theme != oldWidget.theme;
  }
}
