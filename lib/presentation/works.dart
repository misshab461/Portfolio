import 'package:flutter/material.dart';
import 'package:portfolio/widgets/text.dart';

class Works extends StatelessWidget {
  Works({super.key});

  final templates = [
    'asset/teplate1.jpeg',
    'asset/teplate2.jpeg',
    'asset/teplate3.jpeg',
    'asset/teplate4.jpeg',
    'asset/teplate5.jpeg',
    'asset/teplate6.jpeg',
  ];

  final usedItems = [
    'NETFLIX CLONE APPLICATION\nFlutter | Bloc | TMDB Movie Database',
    'SPOTIFY CLONE APPLICATION\nFlutter | Provider | Local Audio',
    'YOGA APPLICATION\nFlutter | Provider | Firebase | Firestore',
    'UNIVERSITY WEBSITE\nFlutter | Provider | Firebase | Firestore',
    'E-COMMERCE APPLICATION\nFlutter | Provider | Firebase | Firestore',
    'PERSONAL PORTFOLIO\nFlutter | Provider | Firebase | GitHub Hosting',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade800,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(100, 10, 100, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SecType(text: 'Projects.', number: '02', color: Colors.white),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: templates.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 1.5,
                mainAxisSpacing: 1.5,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return HoverableProject(
                  template: templates[index],
                  projectInfo: usedItems[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HoverableProject extends StatelessWidget {
  final String template;
  final String projectInfo;

  HoverableProject({
    super.key,
    required this.template,
    required this.projectInfo,
  });

  // Instead of setState, use ValueNotifier
  final ValueNotifier<bool> _isHovered = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _isHovered.value = true,
      onExit: (_) => _isHovered.value = false,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(template),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: _isHovered,
            builder: (context, isHovered, _) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: isHovered ? Colors.black : Colors.transparent,
                ),
                child: Center(
                  child: isHovered
                      ? CsText(
                          text: projectInfo,
                          fontSize: 18,
                          color: Colors.white,
                          textAlign: TextAlign.center,
                        )
                      : const SizedBox.shrink(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
