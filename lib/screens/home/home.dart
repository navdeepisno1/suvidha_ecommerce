import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:suvidha_e_commerce/utils/widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color colorP = Colors.cyan;
  Color colorS = Colors.white;
  String headingText = 'Pillow Collection';
  int selected = 0;
  Duration duration = Duration(milliseconds: 100);

  @override
  Widget build(BuildContext context) {
    List<Widget> bodyWidgets = [
      AnimatedContainer(
        duration: duration,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  '$headingText',
                  fontSize: 24,
                  padding: EdgeInsets.symmetric(
                    horizontal: 48,
                    vertical: 12,
                  ),
                  color: colorS,
                  fontWeight: FontWeight.w900,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 48),
                  child: GestureDetector(
                    child: Icon(
                      Icons.menu_rounded,
                      color: colorS,
                    ),
                    onTap: () {
                      //Todo: Open Navbar drawer
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            AnimatedContainer(
              duration: duration,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.11),
                border: Border.all(color: colorS, width: 2),
                borderRadius: BorderRadius.circular(100),
              ),
              margin: EdgeInsets.symmetric(horizontal: 48),
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search',
                        hintStyle: TextStyle(
                          color: colorS,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.search_rounded,
                      color: colorS,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 48),
            AnimatedContainer(
              duration: duration,
              padding: EdgeInsets.symmetric(horizontal: 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    'Collections',
                    color: colorS,
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: BorderSide(color: colorS, width: 2),
                    )),
                    child: CustomText(
                      'All',
                      color: colorS,
                      fontWeight: FontWeight.w900,
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: colorP,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(56),
          ),
        ),
      ),
      AnimatedContainer(
        duration: duration,
        padding: EdgeInsets.only(left: 48),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              10,
              (index) => AnimatedContainer(
                duration: duration,
                child: Stack(
                  children: [
                    AnimatedContainer(
                      duration: duration,
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              selected = index;
                              setState(() {
                                int r = Random().nextInt(255);
                                int g = Random().nextInt(255);
                                int b = Random().nextInt(255);
                                double opacity = 1;
                                colorP = Color.fromRGBO(r, g, b, opacity);
                              });
                            },
                            child: AnimatedContainer(
                              duration: duration,
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 12),
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                color:
                                    (index == selected) ? colorP : Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomRight: (index == selected)
                                      ? Radius.circular(100)
                                      : Radius.zero,
                                  bottomLeft: (index == selected)
                                      ? Radius.circular(100)
                                      : Radius.zero,
                                ),
                              ),
                              child: Icon(
                                Icons.home,
                                color: (index == selected) ? colorS : colorP,
                              ),
                            ),
                          ),
                          CustomText(
                            'Home',
                            fontWeight: FontWeight.bold,
                            color: colorP,
                          ),
                        ],
                      ),
                    ),
                    (index == selected)
                        ? Positioned(
                            top: 0,
                            left: 0,
                            child: AnimatedContainer(
                              duration: duration,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: AnimatedContainer(
                                      duration: duration,
                                      width: 12,
                                      height: 12,
                                      color: colorP,
                                    ),
                                  ),
                                  AnimatedContainer(
                                    duration: duration,
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : AnimatedContainer(
                            duration: duration,
                          ),
                    (index == selected)
                        ? Positioned(
                            right: 0,
                            top: 0,
                            child: AnimatedContainer(
                              duration: duration,
                              child: Stack(
                                children: [
                                  Positioned(
                                    top: 0,
                                    left: 0,
                                    child: AnimatedContainer(
                                      duration: duration,
                                      width: 12,
                                      height: 12,
                                      color: colorP,
                                    ),
                                  ),
                                  AnimatedContainer(
                                    duration: duration,
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        : AnimatedContainer(
                            duration: duration,
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: AnimationLimiter(
              child: ListView.builder(
                itemCount: bodyWidgets.length,
                itemBuilder: (BuildContext context, int index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: bodyWidgets[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 48, vertical: 12),
            decoration: BoxDecoration(
                color: colorP,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16),
                  topLeft: Radius.circular(16),
                )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                  4,
                  (index) => Container(
                        child: Icon(
                          Icons.home,
                          color: colorS,
                          size: 32,
                        ),
                      ),),
            ),
          ),
        ],
      ),
    );
  }
}
