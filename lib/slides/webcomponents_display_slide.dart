import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:burikaigi2026_slide/widgets/code_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

// スライド3: HtmlElementViewでの表示
class WebComponentsDisplaySlide extends FlutterDeckSlideWidget {
  const WebComponentsDisplaySlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/webcomponents-display',
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
              '2. HtmlElementViewで表示',
              style: slideTheme.heading,
            ),
            Text(
              'Widget Tree内に配置',
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
                        text: '''import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 300,
          height: 200,
          child: HtmlElementView(
            viewType: 'my-web-component',
          ),
        ),
      ),
    );
  }
}''',
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
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
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.only(left: 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 12.0,
                            children: [
                              Text(
                                '• 文字列のIDで配置',
                                style: slideTheme.body,
                              ),
                              Text(
                                '• 通常のWidgetのように配置',
                                style: slideTheme.body,
                              ),
                              Text(
                                '• HTMLでWCを埋め込む',
                                style: slideTheme.body,
                              ),
                              SizedBox(height: 24),
                              Text(
                                '⚠️HTMLの埋め込みは高価な処理',
                                style: slideTheme.body
                                    .copyWith(color: colorScheme.error),
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
