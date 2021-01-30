import 'package:flutter/material.dart';

class AnimatedProgressBar extends StatefulWidget {
  final double progress;

  const AnimatedProgressBar({this.progress});
  @override
  _AnimatedProgressBarState createState() => _AnimatedProgressBarState();
}

class _AnimatedProgressBarState extends State<AnimatedProgressBar>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Tween<double> _tween;
  Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    _tween = Tween(begin: 0, end: widget.progress);
    _animation = _tween.animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.stop();
    super.dispose();
  }

  void runAnimation(double progress) {
    if (_tween != null) {
      _tween.begin = _tween.end;
      _controller.reset();
      _tween.end = progress;
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(AnimatedProgressBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.progress != null && !_controller.isAnimating) {
      runAnimation(widget.progress);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return LinearProgressIndicator(
          value: _animation.value,
        );
      },
    );
  }
}
