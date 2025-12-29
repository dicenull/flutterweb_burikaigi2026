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
  const SlideData(text: '高橋メソッド'),
  const SlideData(text: '大きな文字で'),
  const SlideData(text: 'シンプルに'),
  const SlideData(text: '伝える'),
  const SlideData(text: 'スライド'),
  // 画像スライドの例
  // 画像を表示するには、assets/images/フォルダに画像を配置し、
  // 以下のようにコメントを外して画像パスを指定してください
  const SlideData(imagePath: 'assets/images/example.png'),
  // テキストと画像の両方を表示することも可能です
  // const SlideData(text: '説明文', imagePath: 'assets/images/example.png'),
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Burikaigi2026 Slide',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
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

  Widget _buildSlideContent(SlideData slide, double fontSize) {
    if (slide.isImageSlide && slide.imagePath != null) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
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
      return Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Text(
            slide.text!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              height: 1.2,
            ),
          ),
        ),
      );
    }
    return const SizedBox.shrink();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final fontSize = (screenSize.width * 0.1).clamp(48.0, 120.0);

    return Scaffold(
      backgroundColor: Colors.white,
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
                return _buildSlideContent(slides[index], fontSize);
              },
            ),
            // スライド番号表示（右下）
            Positioned(
              bottom: 16,
              right: 16,
              child: Text(
                '${_currentPage + 1} / ${slides.length}',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
