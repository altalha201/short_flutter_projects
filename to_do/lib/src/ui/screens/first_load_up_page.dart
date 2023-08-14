import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'start_guid_pages/get_started_page.dart';
import 'start_guid_pages/page_one.dart';
import 'start_guid_pages/page_three.dart';
import 'start_guid_pages/page_two.dart';

class FirstLoadUpPage extends StatefulWidget {
  const FirstLoadUpPage({Key? key}) : super(key: key);

  @override
  State<FirstLoadUpPage> createState() => _FirstLoadUpPageState();
}

class _FirstLoadUpPageState extends State<FirstLoadUpPage> {
  late PageController _pageController;

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    _pageController.dispose();
    super.dispose();
  }

  int _currentPage = 0;

  final List<Widget> _pageList = [
    const PageOne(),
    const PageTwo(),
    const PageThree(),
    const GetStartedPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              children: _pageList,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
            ),
            Visibility(
              visible: _currentPage < 3,
              replacement: const SizedBox.shrink(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {
                          _pageController.animateToPage(
                            3,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInSine,
                          );
                        },
                        child: const Text("Skip"),
                      ),
                      SmoothPageIndicator(
                        controller: _pageController,
                        count: _pageList.length - 1,
                        effect: ExpandingDotsEffect(
                          dotColor: Colors.orange.withOpacity(0.65),
                          activeDotColor: Colors.orange,
                          dotHeight: 8.0,
                          dotWidth: 8.0,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInSine,
                          );
                        },
                        child: const Text("Next"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32.0,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
