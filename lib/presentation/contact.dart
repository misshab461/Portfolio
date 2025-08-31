import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/presentation/top_section.dart';
import 'package:portfolio/widgets/slade.dart';
import 'package:portfolio/widgets/text.dart';

import 'package:url_launcher/url_launcher.dart';

class Contact extends StatelessWidget {
  Contact({super.key});

  final nameCr = TextEditingController();
  final emailCr = TextEditingController();
  final subjectCr = TextEditingController();
  final messageCr = TextEditingController();
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

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 850,
      width: double.infinity,
      color: const Color(0xFFF8F5F2), // light background

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
        child: SizedBox(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // LEFT SIDE (Text + Email + Socials)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    SecType(text: 'Get in Touch.', number: '02'),
                    CsText(
                      text: "Let's Talk.",
                      fontSize: 70,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.alumniSans().fontFamily,
                      color: Color(0xFF8B4513), // brown
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "I'd like to hear from you!",
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Whether you’re looking to collaborate, discuss a project, or simply connect, please drop me a message. I’ll get back to you as soon as possible.",
                      style: TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                    const SizedBox(height: 32),

                    // Email
                    Row(
                      children: const [
                        Icon(
                          CupertinoIcons.mail,
                          size: 20,
                          color: Colors.black54,
                        ),
                        SizedBox(width: 8),
                        CsText(
                          text:
                              "misshabk461@gmail.com\naqliontechnologies@gmail.com",
                          fontSize: 14,
                          overflow: TextOverflow.visible,
                          maxLines: 2,
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),

                    // Social Icons
                    EntryAnimation(
                      duration: 1600,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: List.generate(icons.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: AnimatedSocialIcon(
                              icon: icons[index],
                              onTap: () async {
                                if (!await launchUrl(Uri.parse(url[index]))) {
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
                  ],
                ),
              ),

              const SizedBox(width: 60),
              Expanded(
                child: Column(
                  children: [
                    Image.asset('asset/contactus.png', height: 400, width: 400),
                    Container(
                      padding: const EdgeInsets.fromLTRB(20, 50, 20, 10),
                      decoration: BoxDecoration(
                        color: Colors.white70,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // First + Last Name
                          Row(
                            children: [
                              Expanded(
                                child: CsField(
                                  controller: nameCr,
                                  label: "Name",
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: CsField(
                                  controller: emailCr,
                                  label: "Email",
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),

                          // Email
                          CsField(controller: subjectCr, label: "Subject"),
                          const SizedBox(height: 16),

                          // Message
                          CsField(
                            controller: messageCr,
                            label: "Message",
                            maxLines: 5,
                          ),
                          const SizedBox(height: 20),

                          // Send Button
                          Align(
                            alignment: Alignment.centerRight,
                            child: AnimatedButton(
                              text: 'Reach Out',
                              color: Colors.grey,
                              colortext: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CsField extends StatelessWidget {
  const CsField({
    super.key,
    required this.controller,
    required this.label,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String label;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: label,
        filled: true,
        fillColor: const Color(0xFFF8F5F2),
        border: InputBorder.none,
      ),
    );
  }
}
