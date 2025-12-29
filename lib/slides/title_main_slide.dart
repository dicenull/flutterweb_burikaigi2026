import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class TitleMainSlide extends FlutterDeckSlideWidget {
  const TitleMainSlide({super.key})
      : super(
          configuration:
              const FlutterDeckSlideConfiguration(route: '/title-main'),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.title(
      title: 'Flutter Web入門',
      subtitle: 'マルチプラットフォーム開発からWebAssemblyまで',
    );
  }
}

