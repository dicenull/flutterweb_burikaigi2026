import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:flutter/material.dart';

/// カードのサイズ
enum InfoCardSize {
  /// コンパクトサイズ（小さめのパディング、フォント）
  compact,

  /// 通常サイズ
  normal,
}

/// 汎用情報カードコンポーネント
///
/// StrategyCard, CompactFileCard, FileCard を統合
class InfoCard extends StatelessWidget {
  const InfoCard({
    super.key,
    required this.title,
    this.subtitle,
    required this.description,
    this.details,
    this.isHighlighted = false,
    this.highlightIcon,
    this.size = InfoCardSize.normal,
  });

  final String title;
  final String? subtitle;
  final String description;

  /// 箇条書きリスト（オプション）
  final List<String>? details;

  /// ハイライト表示するか
  final bool isHighlighted;

  /// ハイライト時に表示するアイコン（check_circle, star など）
  final IconData? highlightIcon;

  /// カードサイズ
  final InfoCardSize size;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final theme = context.slideTextTheme;

    final isCompact = size == InfoCardSize.compact;
    final padding = isCompact ? 16.0 : 24.0;
    final titleFontSize = isCompact ? 36.0 : 48.0;
    final subtitleFontSize = isCompact ? 32.0 : 36.0;
    final descriptionFontSize = isCompact ? 28.0 : 40.0;
    final iconSize = isCompact ? 24.0 : 32.0;
    final borderRadius = isCompact ? 8.0 : 12.0;

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: isHighlighted
            ? colorScheme.primaryContainer.withValues(alpha: 0.3)
            : colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(borderRadius),
        border: isHighlighted
            ? Border.all(
                color: colorScheme.primary,
                width: 2,
              )
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // タイトル行
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: theme.body.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: titleFontSize,
                    color: isHighlighted
                        ? colorScheme.primary
                        : colorScheme.onSurface,
                  ),
                ),
              ),
              if (isHighlighted && highlightIcon != null)
                Icon(
                  highlightIcon,
                  color: colorScheme.primary,
                  size: iconSize,
                ),
            ],
          ),

          // サブタイトル
          if (subtitle != null) ...[
            SizedBox(height: isCompact ? 8 : 8),
            Text(
              subtitle!,
              style: theme.body.copyWith(
                fontSize: subtitleFontSize,
                color: colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),
          ],

          // 説明
          SizedBox(height: isCompact ? 8 : 16),
          Text(
            description,
            style: theme.body.copyWith(
              fontSize: descriptionFontSize,
            ),
          ),

          // 箇条書きリスト
          if (details != null && details!.isNotEmpty) ...[
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 12.0,
                children: details!
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
        ],
      ),
    );
  }
}
