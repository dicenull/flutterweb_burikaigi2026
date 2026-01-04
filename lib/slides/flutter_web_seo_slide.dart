import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:burikaigi2026_slide/widgets/code_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class FlutterWebSeoSlide extends FlutterDeckSlideWidget {
  const FlutterWebSeoSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-web-seo',
          ),
        );

  @override
  Widget build(BuildContext context) {
    final theme = context.slideTextTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 32.0,
          children: [
            Text(
              'Flutter WebとSEO',
              style: theme.heading,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 32.0,
                      children: [
                        Text(
                          '公式推奨のアプローチ',
                          style:
                              theme.body.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 24.0,
                            children: [
                              Text(
                                'index.htmlにmetaタグを設定',
                                style: theme.body,
                              ),
                              const SimpleCodeBlock(
                                text:
                                    '<meta name="description" content="...">\n<meta property="og:title" content="...">',
                              ),
                              const SizedBox(height: 8),
                              Text('別途SEO対応ページを作成、\nFlutter Webに誘導',
                                  style: theme.body),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 16.0,
                          children: [
                            Text(
                              '公式ドキュメントより',
                              style: theme.body.copyWith(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SelectableText.rich(
                              TextSpan(
                                style: theme.body.copyWith(fontSize: 36),
                                children: [
                                  const TextSpan(
                                      text:
                                          '「Flutter Webは検索エンジンが適切にインデックスするために必要なものと一致しません。静的またはドキュメントのようなWebコンテンツにはHTMLを使用することを推奨します。また、'),
                                  TextSpan(
                                    text:
                                        'Flutterで作成したアプリケーション体験と、ランディングページ、マーケティングコンテンツ、ヘルプコンテンツを分離することを推奨します',
                                    style: theme.body.copyWith(
                                      fontSize: 36,
                                      fontWeight: FontWeight.bold,
                                      color: colorScheme.primary,
                                    ),
                                  ),
                                  const TextSpan(
                                      text: '（これらはSEO最適化されたHTMLで作成）。」'),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            SelectableText(
                              'https://docs.flutter.dev/platform-integration/web/faq',
                              style: theme.body.copyWith(
                                fontSize: 32,
                                color: colorScheme.primary,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
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
