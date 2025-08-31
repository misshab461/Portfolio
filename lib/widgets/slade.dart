import 'package:flutter/material.dart';

enum EntryTransition {
  fade,
  slideUp,
  slideDown,
  slideLeft,
  slideRight,
  scale,
  rotate,
  blackFade,
}

/// General-purpose animation wrapper
class EntryAnimation extends StatefulWidget {
  final Widget child;
  final int duration;
  final int delay;
  final EntryTransition transition;
  final Curve curve;
  final double offset;

  const EntryAnimation({
    super.key,
    required this.child,
    this.duration = 800,
    this.delay = 0,
    this.transition = EntryTransition.fade,
    this.curve = Curves.easeOut,
    this.offset = 50,
  });

  @override
  State<EntryAnimation> createState() => _EntryAnimationState();
}

class _EntryAnimationState extends State<EntryAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<double> _scale;
  late Animation<double> _rotate;
  late Animation<Offset> _slide;
  late Animation<Color?> _blackFade;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );

    final curved = CurvedAnimation(parent: _controller, curve: widget.curve);

    _fade = Tween<double>(begin: 0, end: 1).animate(curved);
    _scale = Tween<double>(begin: 0.8, end: 1.0).animate(curved);
    _rotate = Tween<double>(begin: -0.3, end: 0).animate(curved);

    // Default slide (up)
    Offset beginOffset;
    switch (widget.transition) {
      case EntryTransition.slideUp:
        beginOffset = Offset(0, widget.offset / 50); // move up
        break;
      case EntryTransition.slideDown:
        beginOffset = Offset(0, -widget.offset / 50); // move down
        break;
      case EntryTransition.slideLeft:
        beginOffset = Offset(widget.offset / 50, 0); // move left
        break;
      case EntryTransition.slideRight:
        beginOffset = Offset(-widget.offset / 50, 0); // move right
        break;
      default:
        beginOffset = Offset.zero;
    }

    _slide = Tween<Offset>(
      begin: beginOffset,
      end: Offset.zero,
    ).animate(curved);

    _blackFade = ColorTween(
      begin: Colors.black,
      end: Colors.transparent,
    ).animate(curved);

    Future.delayed(Duration(milliseconds: widget.delay), () {
      if (mounted) _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.transition) {
      case EntryTransition.fade:
        return FadeTransition(opacity: _fade, child: widget.child);

      case EntryTransition.slideUp:
      case EntryTransition.slideDown:
      case EntryTransition.slideLeft:
      case EntryTransition.slideRight:
        return SlideTransition(
          position: _slide,
          child: FadeTransition(opacity: _fade, child: widget.child),
        );

      case EntryTransition.scale:
        return ScaleTransition(
          scale: _scale,
          child: FadeTransition(opacity: _fade, child: widget.child),
        );

      case EntryTransition.rotate:
        return RotationTransition(
          turns: _rotate,
          child: FadeTransition(opacity: _fade, child: widget.child),
        );

      case EntryTransition.blackFade:
        return AnimatedBuilder(
          animation: _blackFade,
          builder: (context, child) {
            return Stack(
              fit: StackFit.expand,
              children: [
                child!,
                Container(color: _blackFade.value),
              ],
            );
          },
          child: widget.child,
        );
    }
  }
}
