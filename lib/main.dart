import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

// スライドデータの型
class SlideData {
  final String? text;
  final String? imagePath;

  const SlideData({this.text, this.imagePath})
      : assert(text != null || imagePath != null, 'textまたはimagePathのいずれかは必須です');

  bool get isTextSlide => text != null;
  bool get isImageSlide => imagePath != null;
}

// スライドデータのリスト
final List<SlideData> slides = [
  // タイトルスライド
  const SlideData(text: 'Flutter Web入門'),
  const SlideData(text: 'マルチプラットフォーム開発から'),
  const SlideData(text: 'WebAssemblyまで'),

  // 目次（1ページ）
  const SlideData(
      text:
          '目次\n\n1. Flutter Webとは\n2. マルチプラットフォーム開発\n3. 既存Webコードとの連携\n4. WebAssembly (WASM)\n5. 実例とデモ\n6. まとめ'),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Burikaigi2026 Slide',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2196F3),
          brightness: Brightness.light,
        ),
        cardTheme: CardThemeData(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: const EdgeInsets.all(16),
        ),
      ),
      home: const SlidePage(),
    );
  }
}

class SlidePage extends StatefulWidget {
  const SlidePage({super.key});

  @override
  State<SlidePage> createState() => _SlidePageState();
}

class _SlidePageState extends State<SlidePage> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToNextSlide() {
    if (_currentPage < slides.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToPreviousSlide() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  Widget _buildSlideContent(
      SlideData slide, double fontSize, BuildContext context) {
    final theme = Theme.of(context);
    final isTitleSlide = _currentPage < 3;
    final isTocSlide = _currentPage == 3;

    Widget content;
    if (slide.isImageSlide && slide.imagePath != null) {
      content = Padding(
        padding: const EdgeInsets.all(24.0),
        child: Image.asset(
          slide.imagePath!,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.broken_image,
                    size: fontSize,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '画像が見つかりません\n${slide.imagePath}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
    } else if (slide.isTextSlide && slide.text != null) {
      content = Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isTitleSlide ? 48.0 : 32.0,
          vertical: isTitleSlide ? 32.0 : 24.0,
        ),
        child: AutoSizeText(
          slide.text!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isTitleSlide ? fontSize * 1.2 : fontSize,
            fontWeight: isTitleSlide ? FontWeight.w900 : FontWeight.bold,
            color: theme.colorScheme.onSurface,
            height: isTocSlide ? 1.8 : 1.4,
          ),
          maxLines: 20,
          minFontSize: 24,
          maxFontSize:
              (isTitleSlide ? fontSize * 1.2 : fontSize).roundToDouble(),
          stepGranularity: 1.0,
        ),
      );
    } else {
      content = const SizedBox.shrink();
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.surface,
            theme.colorScheme.surfaceContainerHighest,
          ],
        ),
      ),
      child: Center(
        child: Card(
          elevation: isTitleSlide ? 8 : 4,
          child: Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.9,
              maxHeight: MediaQuery.of(context).size.height * 0.85,
            ),
            child: content,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;
    final fontSize = (screenSize.width * 0.08).clamp(36.0, 100.0);
    final progress = (_currentPage + 1) / slides.length;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Focus(
        autofocus: true,
        onKeyEvent: (node, event) {
          if (event is KeyDownEvent) {
            if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
              _goToNextSlide();
              return KeyEventResult.handled;
            } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
              _goToPreviousSlide();
              return KeyEventResult.handled;
            }
          }
          return KeyEventResult.ignored;
        },
        child: Stack(
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: slides.length,
              itemBuilder: (context, index) {
                return _buildSlideContent(slides[index], fontSize, context);
              },
            ),
            // プログレスバー（上部）
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                ),
                child: FractionallySizedBox(
                  widthFactor: progress,
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                      boxShadow: [
                        BoxShadow(
                          color: theme.colorScheme.primary.withOpacity(0.5),
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            // スライド番号表示（右下）
            Positioned(
              bottom: 24,
              right: 24,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest
                      .withOpacity(0.9),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  '${_currentPage + 1} / ${slides.length}',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
