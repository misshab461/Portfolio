import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:portfolio/presentation/web/about.dart';
import 'package:portfolio/presentation/web/contact.dart';
import 'package:portfolio/presentation/web/top_section.dart';
import 'package:portfolio/presentation/web/works.dart';
import 'package:portfolio/widgets/nav_bar.dart';

/// 🔹 Section keys
final GlobalKey introKey = GlobalKey();
final GlobalKey aboutKey = GlobalKey();
final GlobalKey worksKey = GlobalKey();
final GlobalKey contactKey = GlobalKey();

/// 🔹 Utility: scroll to section
void scrollToSection(GlobalKey key) {
  final context = key.currentContext;
  if (context != null) {
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 800),
      curve: Curves.ease,
    );
  }
}

/// ----------------------
/// MainScreen (Stateless)
/// ----------------------
class MainScreenWeb extends StatelessWidget {
  MainScreenWeb({super.key});

  final ScrollController _scrollController = ScrollController();
  final ValueNotifier<int> selectedIndex = ValueNotifier(0);
  final ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

  /// 🔹 Decide which section is visible & update navbar
  void _updateSelectedSection() {
    final scrollPos = _scrollController.offset;
    double aboutPos = _getOffsetFromKey(aboutKey);
    double worksPos = _getOffsetFromKey(worksKey);
    double contactPos = _getOffsetFromKey(contactKey);

    if (scrollPos >= contactPos - 200) {
      selectedIndex.value = 3;
    } else if (scrollPos >= worksPos - 200) {
      selectedIndex.value = 2;
    } else if (scrollPos >= aboutPos - 200) {
      selectedIndex.value = 1;
    } else {
      selectedIndex.value = 0;
    }
  }

  double _getOffsetFromKey(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      final box = context.findRenderObject() as RenderBox;
      return box.localToGlobal(Offset.zero, ancestor: null).dy +
          _scrollController.offset;
    }
    return double.infinity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder<bool>(
        valueListenable: scrollNotifier,
        builder: (context, _, __) {
          return NotificationListener<UserScrollNotification>(
            onNotification: (notification) {
              ScrollDirection direction = notification.direction;

              if (direction == ScrollDirection.reverse &&
                  notification.metrics.pixels > 600) {
                scrollNotifier.value = false;
              } else if (direction == ScrollDirection.forward) {
                scrollNotifier.value = true;
              }

              _updateSelectedSection();
              return true;
            },
            child: Stack(
              children: [
                SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      // Intro (TopSection + Navbar)
                      SizedBox(
                        key: introKey,
                        child: Stack(
                          children: [
                            const TopSection(),
                            Positioned(
                              top: 30,
                              left: 60,
                              right: 60,
                              child: NavBar(
                                selectedIndex: selectedIndex,
                                onItemSelected: (index) {
                                  selectedIndex.value = index;
                                  switch (index) {
                                    case 0:
                                      scrollToSection(introKey);
                                      break;
                                    case 1:
                                      scrollToSection(aboutKey);
                                      break;
                                    case 2:
                                      scrollToSection(worksKey);
                                      break;
                                    case 3:
                                      scrollToSection(contactKey);
                                      break;
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),

                      About(key: aboutKey),
                      Works(key: worksKey),
                      Contact(key: contactKey),
                    ],
                  ),
                ),

                // Floating navbar
                ValueListenableBuilder<int>(
                  valueListenable: selectedIndex,
                  builder: (_, __, ___) {
                    return scrollNotifier.value
                        ? const SizedBox()
                        : NavBar(
                            selectedIndex: selectedIndex,
                            onItemSelected: (index) {
                              selectedIndex.value = index;
                              switch (index) {
                                case 0:
                                  scrollToSection(introKey);
                                  break;
                                case 1:
                                  scrollToSection(aboutKey);
                                  break;
                                case 2:
                                  scrollToSection(worksKey);
                                  break;
                                case 3:
                                  scrollToSection(contactKey);
                                  break;
                              }
                            },
                          );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
