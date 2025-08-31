import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/main_screen.dart';
import 'package:portfolio/widgets/slade.dart';
import 'package:portfolio/widgets/text.dart';

import 'package:url_launcher/url_launcher.dart';

final icons = [
  'asset/github.png',
  'asset/linkedin.png',
  'asset/facebook.png',
  'asset/instagram.png',
];
final url = [
  'https://github.com/misshab461?tab=repositories',
  'https://www.linkedin.com/in/misshabk/',
  'https://facebook.com/michuuzz.michu',
  'https://instagram.com/misshub_?igsh=MXdteTBzM3M5eTJubQ==',
];

/// Reusable social icon with animation
class AnimatedSocialIcon extends StatelessWidget {
  final String icon;
  final int delay;
  final void Function()? onTap;

  const AnimatedSocialIcon({
    super.key,
    required this.icon,
    this.delay = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return EntryAnimation(
      duration: delay,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Image.asset(icon, width: 20, height: 20),
        ),
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 800,
      child: Row(
        children: [
          // Left content
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const EntryAnimation(
                      transition: EntryTransition.slideUp,
                      child: CsText(
                        text: 'HELLO',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(255, 255, 68, 0),
                        letterSpacing: 2.0,
                      ),
                    ),
                    const SizedBox(height: 20),
                    EntryAnimation(
                      duration: 1000,
                      transition: EntryTransition.fade,
                      child: CsText(
                        text:
                            "I'm Misshab\na Flutter Developer\nBased in Somewhere.",
                        fontSize: 65,
                        fontWeight: FontWeight.w300,
                        fontFamily: GoogleFonts.playfair().fontFamily,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 60),
                    EntryAnimation(
                      duration: 1200,
                      transition: EntryTransition.slideRight,
                      child: Row(
                        children: [
                          AnimatedButton(
                            text: 'MORE ABOUT ME',
                            onTap: () {
                              scrollToSection(aboutKey);
                            },
                          ),
                          const SizedBox(width: 20),
                          AnimatedButton(
                            onTap: () {
                              scrollToSection(contactKey);
                            },
                            text: 'GET IN TOUCH',
                            color: Colors.black26,
                            colortext: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Right content
          Expanded(
            child: Container(
              color: const Color(0xFF2C2C2C),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: const EntryAnimation(
                      delay: 100,
                      transition: EntryTransition.scale,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('asset/me.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    right: 40,
                    top: 0,
                    bottom: 0,
                    child: EntryAnimation(
                      duration: 1600,
                      transition: EntryTransition.slideLeft,
                      child: Container(
                        margin: EdgeInsets.symmetric(vertical: 270),
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(icons.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.fromLTRB(
                                  15,
                                  10,
                                  10,
                                  15,
                                ),
                                child: AnimatedSocialIcon(
                                  icon: icons[index],
                                  onTap: () async {
                                    if (!await launchUrl(
                                      Uri.parse(url[index]),
                                    )) {
                                      throw Exception(
                                        'Could not launch ${url[index]}',
                                      );
                                    }
                                  },
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 100,
                    left: 60,
                    child: const EntryAnimation(
                      transition: EntryTransition.rotate,
                      duration: 1400,
                      child: AnimatedButton(text: 'GET MY CV'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
