import 'package:flutter/material.dart';
import 'package:i_dream_career/screens/sing_in.dart';
import 'package:i_dream_career/widgets/slide_page.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:liquid_swipe/Helpers/Helpers.dart';

// ignore: use_key_in_widget_constructors
class Features extends StatefulWidget {
  @override
  _Features createState() => _Features();
}


class _Features extends State<Features> {

  late LiquidController liquidController;
  late UpdateType updateType;
  int currentPage = 0;


  Widget _indicator(bool isActive) {
    // ignore: sized_box_for_whitespace
    return Container(
      height: 11,
      child: AnimatedContainer(

        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 4.0),
        height: 11,
        width: 11,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          radius: 5.5,
          backgroundColor: currentPage.isEven?isActive ? const Color(0xFF65b3f8): const Color(0xFF65b3f8):Colors.white,
          child: CircleAvatar(
            radius: 4,
            backgroundColor:currentPage.isEven?isActive ? const Color(0xFF65b3f8): Colors.white:isActive ?  Colors.white:const Color(0xFF65b3f8),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            LiquidSwipe(
              positionSlideIcon: 0.7,
              slideIconWidget: currentPage==4?const SizedBox():Image.asset(
                currentPage.isOdd
                    ? "assets/images/arrow black.png"
                    : "assets/images/arrow white.png",
                width: 40,
                height: 40,
              ),
              onPageChangeCallback: pageChangeCallback,
              waveType: WaveType.liquidReveal,
              liquidController: liquidController,
              ignoreUserGestureWhileAnimating: true,
              enableLoop: false,
              fullTransitionValue: 600,
              enableSideReveal: true,


              pages: [
                SlidePage(
                  width: deviceWidth,
                  height: deviceHeight,
                  image: Image.asset(
                    "assets/images/slider1.png",
                    height: deviceHeight * 0.4,
                  ),
                  titleImage:  Image.asset(
                    "assets/images/ninja.png",
                    height: deviceHeight * 0.05,
                  ),
                  title: "Explore like a",
                  title2: "Ninja! ",
                  subTitle:
                      "Take your career to next level with personalized career info based on your interests, skill & personality.",
                ),
                SlidePage(
                  width: deviceWidth,
                  height: deviceHeight,
                  image: Padding(
                    padding: const EdgeInsets.all(22.0),
                    child: Image.asset(
                      "assets/images/slider2.png",
                      height: deviceHeight * 0.35,
                    ),
                  ),
                  titleImage:  Image.asset(
                    "assets/images/tick.png",
                    height: deviceHeight * 0.05,
                  ),
                  bgColor: const Color(0xFF65b3f8),
                  title: "Choose like a ",
                  title2: "Pro! ",
                  subTitle:
                      "No matter what aspect of college life you are looking for, we provide listings and rankings based on your preferences.",
                ),
                SlidePage(
                  width: deviceWidth,
                  height: deviceHeight,
                  image: Image.asset(
                    "assets/images/slider3.png",
                    height: deviceHeight * 0.4,
                  ),
                  titleImage:  Image.asset(
                    "assets/images/real world.png",
                    height: deviceHeight * 0.05,
                  ),
                  title: "Prepare for the",
                  title2: "Real world! ",
                  subTitle:
                      "We'll show you exactly what to do to make your dream job a reality",
                ),
                SlidePage(
                  width: deviceWidth,
                  height: deviceHeight,
                  image: Image.asset(
                    "assets/images/slider4.png",
                    height: deviceHeight * 0.4,
                  ),
                  bgColor: const Color(0xFF65b3f8),
                  title: "How can we ",
                  title2: "Help ? 🤚🏻  ",
                  subTitle:
                      "Get ready for your transition from school to college and finally to a perfect career with us!",
                ),
                SignIn(
                  onPressBackButton: (){
                    liquidController.animateToPage(page: 3, duration: 600);
                  },
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[],
              ),
            ),
            currentPage>3?const SizedBox(): Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 45.0, right: 25),
                child: TextButton(
                  onPressed: () {
                    liquidController.animateToPage(page: 4, duration: 600);
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 14,
                      color: currentPage.isEven ? Colors.grey : Colors.white,
                    ),
                  ),
                  // color: Colors.white.withOpacity(0.01),
                ),
              ),
            ),
            currentPage>3?const SizedBox():Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                // ignore: avoid_unnecessary_containers
                child: Container(
                  child: Row(
                    children: [
                      _indicator(currentPage==0),
                      _indicator(currentPage==1),
                      _indicator(currentPage==2),
                      _indicator(currentPage==3),
                    ],
                  )

                ),
              ),
            )
          ],
        ),
      ),
    );

  }

  pageChangeCallback(int page) {
    setState(() {
      currentPage = page;
    });
  }
}

