import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/widgets/slade.dart';

class CsText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;

  // ✅ Extra customization options
  final Color color;
  final String? fontFamily;
  final double letterSpacing;
  final double? height;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final int? maxLines;

  const CsText({
    super.key,
    required this.text,
    required this.fontSize,
    this.fontWeight,
    this.color = Colors.black, // default white
    this.fontFamily,
    this.letterSpacing = 1.0,
    this.height,
    this.textAlign = TextAlign.start,
    this.overflow = TextOverflow.visible,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return SelectableText(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily,
        letterSpacing: letterSpacing,
        height: height,
        overflow: overflow,
      ),
    );
  }
}

class SecType extends StatelessWidget {
  final String text;
  final String number;
  final Color color;
  final double numS;
  final double textS;
  const SecType({
    super.key,
    required this.text,
    required this.number,
    this.color = Colors.black,
    this.numS = 200,
    this.textS = 45,
  });

  @override
  Widget build(BuildContext context) {
    return EntryAnimation(
      moveUp: true,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: 400,
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: Text(
                  number,
                  style: TextStyle(
                    fontSize: numS,
                    fontWeight: FontWeight.bold,
                    fontFamily: GoogleFonts.dmSerifDisplay().fontFamily,
                    color: Colors.grey.withAlpha(130),
                  ),
                ),
              ),
              CsText(
                text: text,
                fontSize: 50,
                color: color,
                fontFamily: GoogleFonts.merriweather().fontFamily,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedButton extends StatefulWidget {
  final String text;
  final void Function()? onTap;
  final Color color;
  final Color colortext;
  final double hp;
  final double vp;

  const AnimatedButton({
    super.key,
    required this.text,
    this.onTap,
    this.color = Colors.grey,
    this.colortext = Colors.black,
    this.hp = 40,
    this.vp = 17,
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          padding: EdgeInsets.symmetric(
            horizontal: widget.hp,
            vertical: widget.vp,
          ),
          decoration: BoxDecoration(
            color: _isHovered ? Colors.red.shade400 : widget.color,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: _isHovered ? Colors.black : widget.colortext,
            ),
          ),
        ),
      ),
    );
  }
}
