import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/presentation/web/main_screen.dart';
import 'package:portfolio/widgets/slade.dart';
import 'package:portfolio/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';

// Social media icons & URLs
final icons = [
  'asset/github.png',
  'asset/linkedin.png',
  'asset/facebook.png',
  'asset/instagram.png',
  'asset/whatsapp.png',
];
final url = [
  'https://github.com/misshab461?tab=repositories',
  'https://www.linkedin.com/in/misshabk/',
  'https://facebook.com/michuuzz.michu',
  'https://instagram.com/misshub_?igsh=MXdteTBzM3M5eTJubQ==',
  'https://wa.me/919526013415?text=Hello%20Misshab%20👋🏻!',
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
      duration: 2000,
      delay: delay,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            height: 35,
            width: 35,

            margin: const EdgeInsets.only(bottom: 10, right: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(image: AssetImage(icon)),
            ),
          ),
        ),
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  const TopSection({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Row(
        children: [
          // Left content
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 60, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const EntryAnimation(
                      delay: 100,
                      moveUp: true,
                      child: CsText(
                        text: 'HELLO',
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFF4400),
                        letterSpacing: 2.5,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Main headline
                    EntryAnimation(
                      delay: 300,
                      duration: 1000,
                      moveUp: true,
                      child: CsText(
                        text:
                            "I'm Misshab\na Flutter Developer\nBased Somewhere.",
                        fontSize: 60,
                        fontWeight: FontWeight.w400,
                        fontFamily: GoogleFonts.playfairDisplay().fontFamily,
                        color: Colors.white,
                        height: 1.2,
                      ),
                    ),

                    const SizedBox(height: 50),

                    // Buttons
                    EntryAnimation(
                      duration: 1500,
                      delay: 500,
                      moveUp: true,
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
                            text: 'GET IN TOUCH',
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
          ),

          // Right content
          Expanded(
            child: Container(
              color: const Color(0xFF2C2C2C),
              child: Stack(
                children: [
                  // Profile Image
                  const Positioned.fill(
                    child: EntryAnimation(
                      duration: 500,
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

                  // Social bar
                  Align(
                    alignment: Alignment.centerRight,
                    child: EntryAnimation(
                      delay: 600,
                      moveUp: true,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(icons.length, (index) {
                          return AnimatedSocialIcon(
                            icon: icons[index],

                            onTap: () async {
                              if (!await launchUrl(
                                Uri.parse(url[index]),
                                mode: LaunchMode.externalApplication,
                              )) {
                                throw Exception(
                                  'Could not launch ${url[index]}',
                                );
                              }
                            },
                          );
                        }),
                      ),
                    ),
                  ),

                  // CV Button
                  Positioned(
                    bottom: 80,
                    left: 50,
                    child: EntryAnimation(
                      delay: 800,
                      moveUp: true,
                      child: AnimatedButton(
                        text: 'GET MY CV',
                        onTap: () async {
                          if (!await launchUrl(
                            Uri.parse(
                              'https://drive.google.com/file/d/1g0yz5lYLKSlB_KzvFeBhpgEM1MdtErk3/view?usp=drive_link',
                            ),
                            mode: LaunchMode.externalApplication,
                          )) {
                            throw Exception('Could not launch $url');
                          }
                        },
                      ),
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
