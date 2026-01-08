// Webプラットフォームでのみ使用
import 'dart:js_interop';
import 'dart:ui_web';

import 'package:burikaigi2026_slide/theme/slide_dimensions.dart';
import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:burikaigi2026_slide/widgets/code_demo_slide.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:web/web.dart' as web;

// スライド4: 双方向通信
class WebComponentsCommunicationSlide extends FlutterDeckSlideWidget {
  const WebComponentsCommunicationSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/webcomponents-communication',
          ),
        );

  @override
  Widget build(BuildContext context) {
    final theme = context.slideTextTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return FlutterDeckSlide.blank(
      builder: (context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(SlideDimensions.cardPadding),
            child: Text(
              '3. 双方向通信',
              style: theme.heading,
            ),
          ),
          Expanded(
            child: CodeDemoSlide(
              codeContent: SelectableText.rich(
                HighlightedCodeBuilder.buildHighlightedCode(
                  code: _communicationCode,
                  highlightedLines: {},
                  theme: theme,
                  colorScheme: colorScheme,
                ),
              ),
              demoContent: const _CommunicationDemo(),
            ),
          ),
        ],
      ),
    );
  }

  static const String _communicationCode =
      '''import 'package:web/web.dart' as web;
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:flutter/material.dart';

// 1. WebComponentsを登録
void registerWebComponent() {
  PlatformViewRegistry.registerViewFactory(
    'communication-demo',
    (int viewId) {
      final container = web.HTMLDivElement()
          ..style.display = 'flex'
          ..style.flexDirection = 'column';
      
      // 表示エリア
      final display = web.HTMLDivElement()
        ..id = 'display'
        ..text = 'Flutterからの値: なし';
      container.append(display);
      
      // 入力フィールド
      final input = web.HTMLInputElement()
        ..type = 'text'
        ..placeholder = 'WebComponentsから入力';
      container.append(input);
      
      // ボタン
      final button = web.HTMLButtonElement()
        ..text = 'Flutterに送信'
        ..onClick.listen((_) {
          // WC → Flutter: カスタムイベントを発火
          web.window.dispatchEvent(
            web.CustomEvent('wc-to-flutter',
              detail: {'value': input.value}));
          input.value = '';
        });
      container.append(button);
      
      return container;
    },
  );
}

// 2. Flutter側で使用
class _CommunicationDemo extends StatefulWidget {
  const _CommunicationDemo();
  
  @override
  State<_CommunicationDemo> createState() => _CommunicationDemoState();
}

class _CommunicationDemoState extends State<_CommunicationDemo> {
  String _wcValue = 'なし';
  int _counter = 0;
  
  @override
  void initState() {
    super.initState();
    registerWebComponent();
    
    // WC → Flutter: イベントリスナーを設定
    web.window.addEventListener('wc-to-flutter', (event) {
      final customEvent = event as web.CustomEvent;
      if (mounted) {
        setState(() {
          _wcValue = customEvent.detail['value']?.toString() ?? 'なし';
        });
      }
    });
  }
  
  void _updateFromFlutter(String value) {
    // Flutter → WC: プロパティを設定
    final display = web.document.getElementById('display') as web.HTMLDivElement?;
    if (display != null) {
      display.text = 'Flutterからの値: \$value';
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 250,
            child: HtmlElementView(
              viewType: 'communication-demo',
            ),
          ),
          const SizedBox(height: 16),
          Text('WebComponentsからの値: \$_wcValue'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _counter++;
              _updateFromFlutter('カウント: \$_counter');
            },
            child: const Text('Flutter → WC'),
          ),
        ],
      ),
    );
  }
}''';
}

// 双方向通信のデモ
class _CommunicationDemo extends StatefulWidget {
  const _CommunicationDemo();

  @override
  State<_CommunicationDemo> createState() => _CommunicationDemoState();
}

class _CommunicationDemoState extends State<_CommunicationDemo> {
  String _wcValue = 'なし';
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      _registerWebComponent();
      _setupEventListener();
    }
  }

  void _registerWebComponent() {
    if (!kIsWeb) return;
    platformViewRegistry.registerViewFactory(
      'communication-demo',
      (int viewId) {
        final container = web.HTMLDivElement()
          ..style.width = '100%'
          ..style.height = '100%'
          ..style.display = 'flex'
          ..style.flexDirection = 'column'
          ..style.gap = '16px'
          ..style.padding = '16px'
          ..style.boxSizing = 'border-box';

        // 表示エリア
        final display = web.HTMLDivElement()
          ..id = 'display'
          ..text = 'Flutterからの値: なし'
          ..style.padding = '8px'
          ..style.border = '1px solid #ccc'
          ..style.borderRadius = '4px';
        container.append(display);

        // 入力フィールド
        final input = web.HTMLInputElement()
          ..type = 'text'
          ..placeholder = 'WebComponentsから入力'
          ..style.padding = '8px'
          ..style.border = '1px solid #ccc'
          ..style.borderRadius = '4px';
        container.append(input);

        // ボタン
        final button = web.HTMLButtonElement()
          ..text = 'Flutterに送信'
          ..style.padding = '8px 16px'
          ..style.border = 'none'
          ..style.borderRadius = '4px'
          ..style.backgroundColor = '#2196F3'
          ..style.color = 'white'
          ..style.cursor = 'pointer'
          ..onClick.listen((_) {
            // WC → Flutter: カスタムイベントを発火
            final event = web.CustomEvent(
              'wc-to-flutter',
              web.CustomEventInit(detail: input.value.toJS),
            );
            web.window.dispatchEvent(event);
            input.value = '';
          });
        container.append(button);

        return container;
      },
    );
  }

  void _setupEventListener() {
    web.window.addEventListener(
      'wc-to-flutter',
      ((web.Event event) {
        final customEvent = event as web.CustomEvent;
        if (mounted) {
          final detail = customEvent.detail;
          if (detail != null) {
            final value = detail.toString();
            setState(() {
              _wcValue = value;
            });
          }
        }
      }).toJS,
    );
  }

  void _updateFromFlutter(String value) {
    if (!kIsWeb) return;
    // Flutter → WC: プロパティを設定
    final display = web.document.getElementById('display');
    if (display != null) {
      display.text = 'Flutterからの値: $value';
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!kIsWeb) {
      return const Center(
        child: Text('このデモはWebプラットフォームでのみ動作します'),
      );
    }

    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: SlideDimensions.itemSpacing,
          children: [
            // WebComponentsゾーン
            Container(
              padding: const EdgeInsets.all(SlideDimensions.smallPadding),
              decoration: BoxDecoration(
                border: Border.all(
                  color: colorScheme.primary,
                  width: SlideDimensions.borderWidthHighlight,
                ),
                borderRadius: BorderRadius.circular(SlideDimensions.borderRadiusSmall),
              ),
              child: Column(
                children: [
                  Text(
                    'WebComponents',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: SlideDimensions.tinySpacing),
                  SizedBox(
                    width: 300,
                    height: 250,
                    child: HtmlElementView(
                      viewType: 'communication-demo',
                    ),
                  ),
                ],
              ),
            ),
            // Flutterゾーン
            Container(
              padding: const EdgeInsets.all(SlideDimensions.smallPadding),
              decoration: BoxDecoration(
                border: Border.all(
                  color: colorScheme.secondary,
                  width: SlideDimensions.borderWidthHighlight,
                ),
                borderRadius: BorderRadius.circular(SlideDimensions.borderRadiusSmall),
              ),
              child: Column(
                children: [
                  Text(
                    'Flutter',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: colorScheme.secondary,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: SlideDimensions.tinySpacing),
                  Text(
                    'WebComponentsからの値: $_wcValue',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: SlideDimensions.tinySpacing),
                  ElevatedButton(
                    onPressed: () {
                      _counter++;
                      _updateFromFlutter('カウント: $_counter');
                    },
                    child: const Text('Flutter → WC'),
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
