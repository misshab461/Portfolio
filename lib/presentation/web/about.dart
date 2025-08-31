import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/widgets/text.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            SecType(text: 'About Me.', number: '01'),
            CsText(
              text: '''
    I’m a Flutter developer passionate about building modern, responsive, and user-friendly mobile and web applications. With a strong foundation in Dart, Flutter, Firebase, and REST APIs, I specialize in creating seamless cross-platform experiences that combine performance with clean design.
    
    Over the past few years, I’ve worked on projects ranging from startup apps and content platforms to event and media applications, where I focused not only on writing efficient code but also on delivering smooth animations, intuitive navigation, and scalable architecture.
    
    I enjoy solving complex problems through code and bringing ideas to life with attention to detail. Whether it’s implementing state management solutions (like Provider, Riverpod, or Bloc), integrating third-party APIs, or designing responsive UIs for multiple devices, I thrive on turning challenges into elegant solutions.
    
    Beyond coding, I’m deeply curious about UI/UX principles, performance optimization, and app deployment pipelines, which helps me ensure every project I work on feels polished and production-ready.
    
    When I’m not coding, you’ll often find me exploring new tools, reading about emerging technologies, or experimenting with creative side projects that push my skills further.
    
    My goal is simple: to build meaningful digital products that add real value and create enjoyable user experiences.            ''',
              fontSize: 20,
              fontFamily: GoogleFonts.robotoSlab().fontFamily,
            ),
            SizedBox(height: 50),
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
              spacing: 10,
              children: [
                Chip(label: Text('Flutter')),
                Chip(label: Text('Dart')),
                Chip(label: Text(' Bloc & Provider')),
                Chip(label: Text('Firebase')),
                Chip(label: Text('Hive')),
                Chip(label: Text('REST APIs')),
                Chip(label: Text('UI/UX Design')),
                Chip(label: Text('Python')),
                Chip(label: Text('C')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
