import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';

/// セクション区切りスライドのコンテンツWidget
class SectionSlideContent extends StatelessWidget {
  const SectionSlideContent({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = context.slideTextTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      color: colorScheme.primary,
      child: Center(
        child: Text(
          title,
          style: theme.sectionTitle.copyWith(color: colorScheme.onPrimary),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
