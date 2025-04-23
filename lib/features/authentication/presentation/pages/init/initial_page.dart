import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:osnv/core/const/colors.dart';
import 'package:osnv/core/const/icons_path.dart';
import 'package:osnv/core/responsive/app_responsive.dart';
import 'package:osnv/core/route/routename.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/pages.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final PageController pageController = PageController();
  int currentpage = 0;
  int totalpage = 3;

  void nextPage() {
    if (currentpage < totalpage - 1) {
      pageController.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, RouteNames.SingUp);
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        currentpage = pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: pageController,
                children: [
                  Pages(
                    title:
                        'We provide the best learning courses & great mentors!',
                    picpath: IconsPath.Person1,
                  ),
                  Pages(
                    title: "Learn anytime and anywhere easily and conveniently",
                    picpath: IconsPath.Person2,
                  ),
                  Pages(
                    title:
                        "Let's improve your skills together with Elera right now!",
                    picpath: IconsPath.Person3,
                  ),
                ],
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: ExpandingDotsEffect(
                activeDotColor: AppColors.pagenation,
                dotHeight: 8,
                dotWidth: 8,
                expansionFactor: 6,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: appW(40)),
              child: Row(
                children: [
                  InitialButtion(
                    text: "Next",
                    onPressed: () {
                      nextPage();
                    },
                  ),
                ],
              ),
            ),
            Gap(40),
          ],
        ),
      ),
    );
  }
}
