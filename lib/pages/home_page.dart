// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce/pages/category_page.dart';
import 'package:ecommerce/pages/product_page.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final _pageController = PageController(initialPage: 0);
  final tabBarIcons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.compass,
    FontAwesomeIcons.cartShopping,
    FontAwesomeIcons.user,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            PageView(
              controller: _pageController,
              onPageChanged: (index) => {
                setState(() {
                  currentIndex = index;
                })
              },
              children: [
                ProductPage(),
                CategoryPage(),
              ],
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                alignment: Alignment.center,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: kBackgroundColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...tabBarIcons.map(
                      (icon) => IconButton(
                        onPressed: () {
                          icon == FontAwesomeIcons.house
                              ? _pageController.jumpToPage(0)
                              : _pageController.jumpToPage(1);
                        },
                        icon: Icon(
                          icon,
                          color: Colors.white60,
                          size: 32,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
