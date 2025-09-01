import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/presentation/web/main_screen.dart';
import 'package:portfolio/widgets/slade.dart';
import 'package:portfolio/widgets/text.dart';

class TopSectionMobile extends StatelessWidget {
  TopSectionMobile({super.key});

  /// 🔹 Controls expanded/collapsed state
  final ValueNotifier<bool> scrollNotifier = ValueNotifier(false);
  final titles = ['Intro', 'About', 'Works', 'Contact'];

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Stack(
      children: [
        // 🔹 Background image
        Container(
          height: 500,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage('asset/me.jpg'),
              colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(.7),
                BlendMode.darken,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // 🔹 Content (intro text, buttons)
        Positioned(
          bottom: 10,
          right: 0,
          left: 0,
          child: Center(
            child: Column(
              children: [
                const EntryAnimation(
                  delay: 100,
                  moveUp: true,
                  child: CsText(
                    text: 'HELLO',
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFFF4400),
                    letterSpacing: 2.5,
                  ),
                ),
                EntryAnimation(
                  delay: 300,
                  duration: 1000,
                  moveUp: true,
                  child: CsText(
                    textAlign: TextAlign.center,
                    text: "I'm Misshab\na Flutter Developer\nBased Somewhere.",
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                    fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                    color: Colors.white,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 30),
                EntryAnimation(
                  duration: 1500,
                  delay: 500,
                  moveUp: true,
                  child: Column(
                    children: [
                      AnimatedButton(
                        hp: mq.width * .2,
                        text: 'MORE ABOUT ME',
                        onTap: () {
                          scrollToSection(aboutKey);
                        },
                      ),
                      const SizedBox(height: 20),
                      AnimatedButton(
                        hp: mq.width * .2,
                        text: '  GET IN TOUCH  ',
                        color: Colors.black54,
                        colortext: Colors.white,
                        onTap: () {
                          scrollToSection(contactKey);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

        // 🔹 Expandable AppBar
        ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (context, expanded, _) {
            return ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                  height: expanded ? 250 : 70, // toggle height
                  padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.8),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 🔹 Top row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CsText(
                              text: 'Portfolio.',
                              fontSize: 28,
                              fontFamily: GoogleFonts.expletusSans().fontFamily,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                            IconButton(
                              onPressed: () {
                                scrollNotifier.value = !expanded;
                              },
                              icon: Icon(
                                expanded
                                    ? CupertinoIcons.xmark
                                    : CupertinoIcons.line_horizontal_3_decrease,
                                color: Colors.white,
                                size: 28,
                              ),
                            ),
                          ],
                        ),

                        // 🔹 Section buttons (show only if expanded)
                        if (expanded) ...[
                          const SizedBox(height: 20),
                          Column(
                            spacing: 5,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: List.generate(titles.length, (index) {
                              return _AppBarButton(
                                title: titles[index],
                                onTap: () {},
                              );
                            }),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}

/// 🔹 Reusable button inside AppBar
class _AppBarButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const _AppBarButton({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      label: Text(
        title,
        style: GoogleFonts.expletusSans(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
      ),
      onPressed: onTap,
    );
  }
}
