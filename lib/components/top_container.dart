// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:ecommerce/utils/colors.dart';
import 'package:ecommerce/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

class TopContainer extends StatelessWidget {
  final String title;
  final String searchBarTitle;

  const TopContainer({
    super.key,
    required this.title,
    required this.searchBarTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              title,
              style: kNormalStyle.copyWith(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            Container(
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kGreyColor.withOpacity(0.8),
              ),
              child: Stack(
                children: [
                  Icon(
                    FontAwesomeIcons.bell,
                    color: Colors.black87,
                    size: 22,
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: kOrangeColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: CachedNetworkImage(
                imageUrl:
                    'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fG1lbiUyMHBob3RvfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                height: 40,
                width: 40,
                fit: BoxFit.cover,
              ),
            )
          ],
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 30,
          ),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: kGreyColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Icon(
                FontAwesomeIcons.magnifyingGlass,
                size: 22,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                searchBarTitle,
                style: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
