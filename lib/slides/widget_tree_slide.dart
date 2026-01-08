import 'package:burikaigi2026_slide/theme/slide_dimensions.dart';
import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class WidgetTreeSlide extends FlutterDeckSlideWidget {
  const WidgetTreeSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/widget-tree',
          ),
        );

  @override
  Widget build(BuildContext context) {
    final theme = context.slideTextTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(SlideDimensions.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: SlideDimensions.sectionSpacing,
          children: [
            Text(
              'Widget Tree',
              style: theme.heading,
            ),
            Text(
              'FlutterのUIはWidgetの木構造',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: SlideDimensions.itemSpacing,
                      children: [
                        Text('• 小さなWidgetを組み合わせてUIを構築', style: theme.body),
                        Text('• 親から子へデータが流れる', style: theme.body),
                        Text('• 状態変更時は該当部分だけ再構築', style: theme.body),
                      ],
                    ),
                  ),
                  const SizedBox(width: SlideDimensions.sectionSpacing),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding:
                          const EdgeInsets.all(SlideDimensions.cardPadding),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(
                            SlideDimensions.borderRadiusSmall),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _TreeNode(
                              label: 'MaterialApp', theme: theme, level: 0),
                          _TreeNode(label: 'Scaffold', theme: theme, level: 1),
                          _TreeNode(label: 'Column', theme: theme, level: 2),
                          _TreeNode(label: 'Text', theme: theme, level: 3),
                          _TreeNode(label: 'Button', theme: theme, level: 3),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TreeNode extends StatelessWidget {
  const _TreeNode({
    required this.label,
    required this.theme,
    required this.level,
  });

  final String label;
  final SlideTextTheme theme;
  final int level;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: level * 24.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (level > 0) ...[
            Text('└─ ', style: theme.code),
          ],
          Text(label, style: theme.code),
        ],
      ),
    );
  }
}
