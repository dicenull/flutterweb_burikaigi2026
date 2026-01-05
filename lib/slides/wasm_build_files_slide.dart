import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

// スライド2: WASM判定フロー
class WasmBuildFilesFlowSlide extends FlutterDeckSlideWidget {
  const WasmBuildFilesFlowSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/wasm-build-files-flow',
          ),
        );

  @override
  Widget build(BuildContext context) {
    final slideTheme = context.slideTextTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24.0,
          children: [
            Text(
              'WASM判定フロー',
              style: slideTheme.heading,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // flutter.js
                  _CompactFileCard(
                    title: 'flutter.js',
                    description: 'WASMサポート判定',
                    details: 'dart2wasmコンパイル、WasmGCを確認',
                    colorScheme: colorScheme,
                    theme: slideTheme,
                  ),
                  const SizedBox(height: 16),
                  // 矢印
                  Icon(
                    Icons.arrow_downward,
                    color: colorScheme.primary,
                    size: 44,
                  ),
                  const SizedBox(height: 16),
                  // 分岐
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: colorScheme.primary,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      'WASMをサポートしているか',
                      style: slideTheme.body.copyWith(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  // 2つのパス
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16.0,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            // 矢印（左）
                            Icon(
                              Icons.check,
                              color: colorScheme.primary,
                              size: 44,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'TRUE',
                              style: slideTheme.body.copyWith(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: colorScheme.primary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            _CompactFileCard(
                              title: 'main.dart.wasm',
                              description: 'WASMビルドを読み込み',
                              details: '約1.9MB',
                              colorScheme: colorScheme,
                              theme: slideTheme,
                              isHighlighted: true,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Icon(
                              Icons.close,
                              color: colorScheme.secondary,
                              size: 44,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'FALSE',
                              style: slideTheme.body.copyWith(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: colorScheme.secondary,
                              ),
                            ),
                            const SizedBox(height: 8),
                            _CompactFileCard(
                              title: 'main.dart.js',
                              description: 'JSビルドを読み込み',
                              details: '約2.4MB',
                              colorScheme: colorScheme,
                              theme: slideTheme,
                            ),
                          ],
                        ),
                      ),
                    ],
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

class _CompactFileCard extends StatelessWidget {
  const _CompactFileCard({
    required this.title,
    required this.description,
    required this.details,
    required this.colorScheme,
    required this.theme,
    this.isHighlighted = false,
  });

  final String title;
  final String description;
  final String details;
  final ColorScheme colorScheme;
  final SlideTextTheme theme;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isHighlighted
            ? colorScheme.primaryContainer.withOpacity(0.3)
            : colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
        border: isHighlighted
            ? Border.all(
                color: colorScheme.primary,
                width: 2,
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8.0,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: theme.body.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                    color: isHighlighted
                        ? colorScheme.primary
                        : colorScheme.onSurface,
                  ),
                ),
              ),
              if (isHighlighted)
                Icon(
                  Icons.star,
                  color: colorScheme.primary,
                  size: 24,
                ),
            ],
          ),
          Text(
            description,
            style: theme.body.copyWith(
              fontSize: 32,
              color: colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
          Text(
            details,
            style: theme.body.copyWith(
              fontSize: 28,
            ),
          ),
        ],
      ),
    );
  }
}

class _FileCard extends StatelessWidget {
  const _FileCard({
    required this.title,
    required this.description,
    required this.details,
    required this.colorScheme,
    required this.theme,
    this.isHighlighted = false,
  });

  final String title;
  final String description;
  final List<String> details;
  final ColorScheme colorScheme;
  final SlideTextTheme theme;
  final bool isHighlighted;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: isHighlighted
            ? colorScheme.primaryContainer.withOpacity(0.3)
            : colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
        border: isHighlighted
            ? Border.all(
                color: colorScheme.primary,
                width: 2,
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 16.0,
        children: [
          Row(
            children: [
              Text(
                title,
                style: theme.body.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 48,
                  color: isHighlighted
                      ? colorScheme.primary
                      : colorScheme.onSurface,
                ),
              ),
              if (isHighlighted) ...[
                const SizedBox(width: 8),
                Icon(
                  Icons.star,
                  color: colorScheme.primary,
                  size: 32,
                ),
              ],
            ],
          ),
          Text(
            description,
            style: theme.body.copyWith(
              fontSize: 40,
              color: colorScheme.onSurface.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 12.0,
              children: details
                  .map((detail) => Text(
                        '• $detail',
                        style: theme.body.copyWith(
                          fontSize: 36,
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
