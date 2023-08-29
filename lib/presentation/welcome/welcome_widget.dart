import 'package:flutter/material.dart';
import 'package:fodei/presentation/register/register_widget.dart';
import 'package:fodei/presentation/welcome/welcome_screen_one.dart';
import 'package:fodei/presentation/welcome/welcome_screen_three.dart';
import 'package:fodei/presentation/welcome/welcome_screen_two.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class WelcomeWidget extends StatefulWidget {
  const WelcomeWidget({super.key});

  @override
  State<StatefulWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  late int selectedPage;
  late final PageController pageController;

  @override
  void initState() {
    selectedPage = 0;
    pageController = PageController(initialPage: selectedPage);
    super.initState();
  }

  void selectCurrentPage(int page) {
    setState(() {
      selectedPage = page;
    });
  }

  void goToNextScreen() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const RegisterWidget()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    const pageCount = 3;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (page) {
                selectCurrentPage(page);
              },
              children: const [
                WelcomeScreenOne(),
                WelcomeScreenTwo(),
                WelcomeScreenThree(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Visibility(
                  visible: selectedPage != 2,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: TextButton(
                    onPressed: () {
                      goToNextScreen();
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(color: Color.fromARGB(255, 75, 85, 99)),
                    ),
                  ),
                ),
                Expanded(
                  child: PageViewDotIndicator(
                    currentItem: selectedPage,
                    size: const Size(8, 8),
                    count: pageCount,
                    unselectedColor: const Color.fromARGB(255, 230, 230, 230),
                    selectedColor: const Color.fromARGB(255, 50, 183, 104),
                    duration: const Duration(milliseconds: 200),
                    onItemClicked: (index) {
                      pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (selectedPage != 2) {
                      pageController.animateToPage(
                        selectedPage + 1,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      );
                      selectCurrentPage(selectedPage + 1);
                    } else {
                      goToNextScreen();
                    }
                  },
                  icon: const Icon(
                    Icons.arrow_forward,
                    color: Color.fromARGB(255, 14, 127, 61),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
