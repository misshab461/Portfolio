import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/widgets/slade.dart';
import 'package:portfolio/widgets/text.dart';

class NavBar extends StatelessWidget {
  final void Function(int index)? onItemSelected;
  final ValueNotifier<int> selectedIndex;

  const NavBar({super.key, required this.selectedIndex, this.onItemSelected});

  @override
  Widget build(BuildContext context) {
    final titles = ['Intro', 'About', 'Works', 'Contact'];

    return EntryAnimation(
      duration: 900,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            height: 70,
            color: Colors.black.withOpacity(0.9),
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left title
                CsText(
                  text: 'Portfolio.',
                  fontSize: 30,
                  fontFamily: GoogleFonts.expletusSans().fontFamily,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),

                // Right nav items
                Row(
                  children: List.generate(titles.length, (index) {
                    return Row(
                      children: [
                        EntryAnimation(
                          duration: 700,
                          delay: index * 150,
                          child: _NavItem(
                            text: titles[index],
                            index: index,
                            selectedIndex: selectedIndex,
                            onTap: () {
                              selectedIndex.value = index;
                              onItemSelected?.call(index);
                            },
                          ),
                        ),
                        if (index != titles.length - 1)
                          const SizedBox(width: 40),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final String text;
  final int index;
  final ValueNotifier<int> selectedIndex;
  final VoidCallback onTap;

  const _NavItem({
    required this.text,
    required this.index,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<bool> isHovered = ValueNotifier(false);

    return ValueListenableBuilder<int>(
      valueListenable: selectedIndex,
      builder: (context, value, child) {
        final isActive = value == index;

        return MouseRegion(
          onEnter: (_) => isHovered.value = true,
          onExit: (_) => isHovered.value = false,
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: onTap,
            child: ValueListenableBuilder<bool>(
              valueListenable: isHovered,
              builder: (context, hovered, _) {
                final color = isActive
                    ? Colors.redAccent
                    : (hovered ? Colors.white : Colors.white70);

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  transform: Matrix4.identity()..scale(hovered ? 1.15 : 1.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                      letterSpacing: 1.0,
                      color: color,
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
