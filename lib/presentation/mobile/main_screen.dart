import 'package:flutter/material.dart';

class MainScreenMobile extends StatelessWidget {
  const MainScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mobile Portfolio')),
      body: const Center(child: Text('Welcome to the Mobile Portfolio')),
    );
  }
}
