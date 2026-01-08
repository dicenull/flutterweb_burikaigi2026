import 'package:burikaigi2026_slide/theme/slide_dimensions.dart';
import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:burikaigi2026_slide/widgets/code_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

// スライド2: PlatformViewRegistryでの登録
class WebComponentsRegisterSlide extends FlutterDeckSlideWidget {
  const WebComponentsRegisterSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/webcomponents-register',
          ),
        );

  @override
  Widget build(BuildContext context) {
    final slideTheme = context.slideTextTheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(SlideDimensions.screenPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: SlideDimensions.itemSpacing,
          children: [
            Text(
              '1. PlatformViewRegistryで登録',
              style: slideTheme.heading,
            ),
            Text(
              'WebComponentsをFlutterに登録',
              style: slideTheme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      child: const SimpleCodeBlock(
                        text: '''import 'package:web/web.dart' as web;
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerWebComponent() {
  PlatformViewRegistry.registerViewFactory(
    'my-web-component',
    (int viewId) {
      final element = web.document.createElement('my-component');
      element.setAttribute('data-value', '123');
      return element;
    },
  );
}''',
                      ),
                    ),
                  ),
                  const SizedBox(width: SlideDimensions.itemSpacing),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'ポイント',
                          style: slideTheme.body.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: SlideDimensions.tinySpacing + 4),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: SlideDimensions.cardPadding),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: SlideDimensions.tinySpacing + 4,
                            children: [
                              Text(
                                '• 文字列でIDを指定',
                                style: slideTheme.body,
                              ),
                              Text(
                                '• web.documentでDOM操作',
                                style: slideTheme.body,
                              ),
                              Text(
                                '• プロパティやイベントリスナーも設定可',
                                style: slideTheme.body,
                              ),
                            ],
                          ),
                        ),
                      ],
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
