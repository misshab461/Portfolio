import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/widgets/text.dart';

class AboutMobile extends StatelessWidget {
  AboutMobile({super.key});
  final skills = [
    'Flutter',
    'Dart',
    'Bloc & Provider',
    'Firebase',
    'Hive',
    'REST APIs',
    'UI/UX Design',
    'Python',
    'C',
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Column(
          children: [
            SecType(text: 'About Me.', number: '01', numS: 150, textS: 30),
            CsText(
              text: '''
Hi, I’m Misshab, a passionate Flutter developer with a love for building modern and responsive applications. I specialize in creating cross-platform mobile and web apps using Flutter and Dart, with strong experience in Firebase, REST APIs, and state management tools like BLoC and Provider. I enjoy transforming ideas into intuitive, user-friendly solutions with clean code and thoughtful design. Beyond Flutter, I also explore Python and C, which help me strengthen my problem-solving skills. My focus is always on performance, simplicity, and great user experiences. I’m constantly learning, improving, and excited to bring creative ideas to life.
''',
              fontSize: 15,
            ),
            SizedBox(height: 30),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '| ',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 158, 11, 0),
                    ),
                  ),
                  TextSpan(
                    text: 'Skills',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: List.generate(
                skills.length,
                (index) => Chip(label: Text(skills[index])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
