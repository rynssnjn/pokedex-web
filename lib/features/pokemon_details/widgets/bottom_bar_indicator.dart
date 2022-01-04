import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BottomBarIndicator extends StatefulWidget {
  const BottomBarIndicator({
    this.controller,
    this.pageIndicator,
    Key? key,
  }) : super(key: key);

  final PageController? controller;
  final Color? pageIndicator;

  @override
  State<BottomBarIndicator> createState() => _BottomBarIndicatorState();
}

class _BottomBarIndicatorState extends State<BottomBarIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: SmoothPageIndicator(
        controller: widget.controller!,
        count: 4,
        effect: ScrollingDotsEffect(
          dotHeight: 10,
          dotWidth: 10,
          activeDotScale: 2,
          activeDotColor: widget.pageIndicator!,
        ),
      ),
    );
  }
}
