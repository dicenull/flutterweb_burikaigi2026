import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_deck/flutter_deck.dart';

void main() {
  runApp(FlutterDeckApp(
    themeMode: ThemeMode.light,
    lightTheme: FlutterDeckThemeData.fromTheme(
      ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF042b59),
        ),
        useMaterial3: true,
      ),
    ),
    configuration: FlutterDeckConfiguration(
      slideSize: FlutterDeckSlideSize.fromAspectRatio(
        aspectRatio: FlutterDeckAspectRatio.ratio16x9(),
      ),
      controls: FlutterDeckControlsConfiguration(
        shortcuts: FlutterDeckShortcutsConfiguration(
          enabled: true,
          nextSlide: SingleActivator(LogicalKeyboardKey.arrowRight),
          previousSlide: SingleActivator(LogicalKeyboardKey.arrowLeft),
        ),
      ),
      footer: FlutterDeckFooterConfiguration(
        showSlideNumbers: true,
      ),
      progressIndicator: FlutterDeckProgressIndicator.gradient(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF2196F3), Color(0xFF1976D2)],
        ),
      ),
    ),
    slides: [
      // タイトルスライド
      FlutterDeckSlide.title(
        title: 'Flutter Web入門',
        subtitle: 'マルチプラットフォーム開発からWebAssemblyまで',
      ),
      FlutterDeckSlide.title(
        title: 'マルチプラットフォーム開発から',
      ),
      FlutterDeckSlide.title(
        title: 'WebAssemblyまで',
      ),

      // 目次
      FlutterDeckSlide.blank(
        builder: (context) => Padding(
          padding: EdgeInsets.all(48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '目次',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 32),
              ...[
                'Flutter Webとは',
                'マルチプラットフォーム開発',
                '既存Webコードとの連携',
                'WebAssembly (WASM)',
                '実例とデモ',
                'まとめ'
              ].asMap().entries.map((entry) => Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: Text(
                      '${entry.key + 1}. ${entry.value}',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    ],
  ));
}
