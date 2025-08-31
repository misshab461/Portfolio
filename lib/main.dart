import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/main_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GoogleFonts.pendingFonts([
    GoogleFonts.robotoSlab(),
    GoogleFonts.playfair(),
    GoogleFonts.dmSerifDisplay(),
    GoogleFonts.alumniSans(),
  ]);
  runApp(MyPortfolioWeb());
}

class MyPortfolioWeb extends StatelessWidget {
  const MyPortfolioWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Misshab Portfolio',
      theme: ThemeData(
        chipTheme: ChipThemeData(
          backgroundColor: Colors.grey.shade200,
          labelStyle: TextStyle(
            fontFamily: GoogleFonts.robotoSlab().fontFamily,
          ),

          brightness: Brightness.dark,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        ),
        primarySwatch: Colors.grey,
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            fontFamily: GoogleFonts.robotoSerif().fontFamily,
          ),
        ),
      ),
      home: MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
