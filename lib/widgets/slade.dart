import 'package:flutter/material.dart';

class EntryAnimation extends StatefulWidget {
  final Widget child;
  final int duration;
  final int delay;
  final Curve curve;
  final bool moveUp; // NEW: fade + slide up option

  const EntryAnimation({
    super.key,
    required this.child,
    this.duration = 800,
    this.delay = 0,
    this.curve = Curves.easeInOut,
    this.moveUp = false,
  });

  @override
  State<EntryAnimation> createState() => _EntryAnimationState();
}

class _EntryAnimationState extends State<EntryAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.duration),
    );

    final curved = CurvedAnimation(parent: _controller, curve: widget.curve);

    _fade = curved;

    _slide = Tween<Offset>(
      begin: widget.moveUp ? const Offset(0, 0.2) : Offset.zero,
      end: Offset.zero,
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
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(position: _slide, child: widget.child),
    );
  }
}
