import 'package:burikaigi2026_slide/theme/slide_dimensions.dart';
import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:burikaigi2026_slide/widgets/code_block.dart';
import 'package:burikaigi2026_slide/widgets/info_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class FlutterWebPwaSlide extends FlutterDeckSlideWidget {
  const FlutterWebPwaSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-web-pwa',
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
              'Flutter WebとProgressive Web App (PWA)',
              style: theme.heading,
            ),
            Text(
              'デフォルトでPWA対応',
              style: theme.body.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: SlideDimensions.screenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: SlideDimensions.itemSpacing,
                children: [
                  Text(
                    '何も設定しなくてもPWAとして動作',
                    style: theme.body,
                  ),
                  Text(
                    'アプリのようにホーム画面に追加可能',
                    style: theme.body,
                  ),
                ],
              ),
            ),
            const SizedBox(height: SlideDimensions.itemSpacing),
            Text(
              'ServiceWorkerキャッシュ戦略',
              style: theme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: SlideDimensions.screenPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: SlideDimensions.smallSpacing,
                children: [
                  Text(
                    'pwa-strategyオプションで変更可能',
                    style: theme.body,
                  ),
                  const SimpleCodeBlock(
                    text: 'flutter build web --pwa-strategy=offline-first',
                  ),
                  const SizedBox(height: SlideDimensions.tinySpacing),
                  Text(
                    'オプション: offline-first, online-first, none',
                    style: theme.body.copyWith(
                      fontSize: 36,
                      color: colorScheme.onSurface.withValues(alpha: 0.7),
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

class FlutterWebPwaServiceWorkerSlide extends FlutterDeckSlideWidget {
  const FlutterWebPwaServiceWorkerSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-web-pwa-service-worker',
          ),
        );

  @override
  Widget build(BuildContext context) {
    final theme = context.slideTextTheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(SlideDimensions.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: SlideDimensions.sectionSpacing,
          children: [
            Text(
              'pwa-strategyオプション',
              style: theme.heading,
            ),
            Expanded(
              child: Row(
                children: [
                  const Expanded(
                    child: InfoCard(
                      title: 'offline-first',
                      subtitle: '推奨',
                      description: 'オフラインでも動作させたい場合',
                      isHighlighted: true,
                      highlightIcon: Icons.check_circle,
                    ),
                  ),
                  const SizedBox(width: SlideDimensions.itemSpacing),
                  const Expanded(
                    child: InfoCard(
                      title: 'online-first',
                      subtitle: '常に最新データが必要な場合',
                      description: 'オンライン優先。\nネットワークを優先的に使用',
                    ),
                  ),
                  const SizedBox(width: SlideDimensions.itemSpacing),
                  const Expanded(
                    child: InfoCard(
                      title: 'none',
                      subtitle: 'ServiceWorkerが不要な場合',
                      description: 'ServiceWorkerを無効化',
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
