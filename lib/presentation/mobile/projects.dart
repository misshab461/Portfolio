import 'package:flutter/material.dart';
import 'package:portfolio/widgets/text.dart';

class ProjectsMobile extends StatelessWidget {
  ProjectsMobile({super.key});
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SecType(
              text: 'My Works.',
              number: '02',
              numS: 150,
              textS: 30,
              color: Colors.white,
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: templates.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return MobileProjectCard(
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

class MobileProjectCard extends StatelessWidget {
  final String template;
  final String projectInfo;

  const MobileProjectCard({
    super.key,
    required this.template,
    required this.projectInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(template),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // Dark overlay with text always visible
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) {
                return Container(
                  height: 100,
                  color: Colors.grey,
                  child: Center(
                    child: Text(projectInfo, textAlign: TextAlign.center),
                  ),
                );
              },
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
      ],
    );
  }
}
