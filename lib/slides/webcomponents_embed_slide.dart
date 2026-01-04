// Webプラットフォームでのみ使用
import 'dart:js_interop';
import 'dart:ui_web';

import 'package:burikaigi2026_slide/theme/slide_text_theme.dart';
import 'package:burikaigi2026_slide/widgets/code_block.dart';
import 'package:burikaigi2026_slide/widgets/code_demo_slide.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:web/web.dart' as web;

// スライド1: 連携概要
class WebComponentsEmbedSlide extends FlutterDeckSlideWidget {
  const WebComponentsEmbedSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/webcomponents-embed',
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
          spacing: 32.0,
          children: [
            Text(
              'Web Componentsとの連携',
              style: slideTheme.heading,
            ),
            Text(
              'Flutter WebでWeb Componentsを埋め込む方法',
              style: slideTheme.body.copyWith(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 20.0,
                  children: [
                    Text(
                      '手順',
                      style:
                          slideTheme.body.copyWith(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 48),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 16.0,
                        children: [
                          Text(
                            '1. PlatformViewRegistryでWeb Componentを登録',
                            style: slideTheme.body,
                          ),
                          Text(
                            '2. HtmlElementViewでWidget Tree内に配置',
                            style: slideTheme.body,
                          ),
                          Text(
                            '3. イベントやプロパティで双方向通信',
                            style: slideTheme.body,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 12.0,
                        children: [
                          Text(
                            'メリット',
                            style: slideTheme.body.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              spacing: 12.0,
                              children: [
                                Text(
                                  '• FlutterのWidget Tree内に配置可能',
                                  style: slideTheme.body,
                                ),
                                Text(
                                  '• 既存のJS資産を再利用',
                                  style: slideTheme.body,
                                ),
                                Text(
                                  '• 双方向通信も可能',
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
            ),
          ],
        ),
      ),
    );
  }
}

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
        padding: const EdgeInsets.all(48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 24.0,
          children: [
            Text(
              '1. PlatformViewRegistryで登録',
              style: slideTheme.heading,
            ),
            Text(
              'Web ComponentをFlutterに登録',
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
                                '• viewTypeは一意の識別子',
                                style: slideTheme.body,
                              ),
                              Text(
                                '• web.Element.tag()で要素を作成',
                                style: slideTheme.body,
                              ),
                              Text(
                                '• プロパティやイベントリスナーも設定可能',
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
                                '• viewTypeは登録時の識別子と一致させる',
                                style: slideTheme.body,
                              ),
                              Text(
                                '• SizedBoxでサイズを指定可能',
                                style: slideTheme.body,
                              ),
                              Text(
                                '• 通常のWidgetと同じように配置可能',
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
      builder: (context) => CodeDemoSlide(
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
    );
  }

  static const String _communicationCode =
      '''import 'package:web/web.dart' as web;
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:flutter/material.dart';

// 1. Web Componentを登録
void registerWebComponent() {
  PlatformViewRegistry.registerViewFactory(
    'communication-demo',
    (int viewId) {
      final container = web.HTMLDivElement()
        ..style.width = '100%'
        ..style.height = '100%'
        ..style.display = 'flex'
        ..style.flexDirection = 'column'
        ..style.gap = '16px'
        ..style.padding = '16px';
      
      // 表示エリア
      final display = web.HTMLDivElement()
        ..id = 'display-\$viewId'
        ..text = 'Flutterからの値: なし';
      container.append(display);
      
      // 入力フィールド
      final input = web.HTMLInputElement()
        ..type = 'text'
        ..placeholder = 'Web Componentから入力';
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
    final display = web.document.getElementById('display-0') as web.HTMLDivElement?;
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
          Text('Web Componentからの値: \$_wcValue'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _counter++;
              _updateFromFlutter('Hello from Flutter! (\$_counter)');
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
          ..id = 'display-$viewId'
          ..text = 'Flutterからの値: なし'
          ..style.padding = '8px'
          ..style.border = '1px solid #ccc'
          ..style.borderRadius = '4px';
        container.append(display);

        // 入力フィールド
        final input = web.HTMLInputElement()
          ..type = 'text'
          ..placeholder = 'Web Componentから入力'
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
    final display = web.document.getElementById('display-0');
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

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 16.0,
          children: [
            SizedBox(
              width: 300,
              height: 250,
              child: HtmlElementView(
                viewType: 'communication-demo',
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Web Componentからの値: $_wcValue',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                _counter++;
                _updateFromFlutter('Hello from Flutter! ($_counter)');
              },
              child: const Text('Flutter → WC'),
            ),
          ],
        ),
      ),
    );
  }
}
