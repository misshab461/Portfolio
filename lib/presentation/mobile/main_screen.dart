import 'package:flutter/material.dart';
import 'package:portfolio/presentation/mobile/about.dart';
import 'package:portfolio/presentation/mobile/contact.dart';
import 'package:portfolio/presentation/mobile/projects.dart';
import 'package:portfolio/presentation/mobile/top.dart';

class MainScreenMobile extends StatelessWidget {
  MainScreenMobile({super.key});
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          TopSectionMobile(),
          AboutMobile(),
          ProjectsMobile(),
          ContactMobile(),
        ],
      ),
    );
  }
}
