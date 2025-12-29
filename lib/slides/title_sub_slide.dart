import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class TitleSubSlide extends FlutterDeckSlideWidget {
  const TitleSubSlide({super.key})
      : super(
          configuration:
              const FlutterDeckSlideConfiguration(route: '/title-sub'),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.title(
      title: 'マルチプラットフォーム開発から',
    );
  }
}

