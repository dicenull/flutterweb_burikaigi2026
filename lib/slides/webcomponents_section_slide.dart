import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class WebComponentsSectionSlide extends FlutterDeckSlideWidget {
  const WebComponentsSectionSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/webcomponents-section',
          ),
        );

  @override
  Widget build(BuildContext context) {
    return FlutterDeckSlide.title(
      title: '2. WebComponentsの活用',
    );
  }
}

