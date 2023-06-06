// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ecommerce/components/image_list_view.dart';
import 'package:ecommerce/pages/home_page.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/utils.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -10,
            left: -150,
            child: Row(
              children: [
                ImageListView(
                  startIndex: 0,
                ),
                ImageListView(
                  startIndex: 1,
                ),
                ImageListView(
                  startIndex: 2,
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.08,
            child: Text(
              'MNMLMANDI',
              textAlign: TextAlign.center,
              style: kTitleStyle,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.white60,
                    Colors.white,
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Your Appearance \nShows Your Quality",
                    style: kNormalStyle.copyWith(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Change The Quality Of Your \nAppearance with MNMLMANDI",
                    style: kNormalStyle.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: buildIndicators(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBackgroundColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                ),
                child: Text('Sign Up with Email'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
