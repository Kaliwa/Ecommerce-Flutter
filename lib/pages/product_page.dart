// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:ecommerce/components/product_list.dart';
import 'package:ecommerce/components/top_container.dart';
import 'package:ecommerce/pages/category_page.dart';
import 'package:ecommerce/utils/colors.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedValue = 0;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 30,
        ),
        child: Column(
          children: [
            TopContainer(
              title: "MNMLMANDI",
              searchBarTitle: "Search Products",
            ),
            TabBar(
              controller: tabController,
              indicatorColor: Colors.transparent,
              labelColor: Colors.white,
              unselectedLabelColor: kBackgroundColor,
              indicatorSize: TabBarIndicatorSize.label,
              onTap: (value) {
                setState(() {
                  selectedValue = value;
                });
                tabController.animateTo(value);
              },
              tabs: [
                Container(
                  width: double.infinity,
                  height: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: selectedValue == 0
                        ? kBackgroundColor
                        : kGreyColor.withOpacity(0.8),
                    boxShadow: selectedValue == 0
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(0, 1),
                            ),
                          ]
                        : null,
                  ),
                  child: Text(
                    "Trending",
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: selectedValue == 1
                        ? kBackgroundColor
                        : kGreyColor.withOpacity(0.8),
                    boxShadow: selectedValue == 1
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: Offset(0, 1),
                            ),
                          ]
                        : null,
                  ),
                  child: Text(
                    "Clothing",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: tabController,
                children: [
                  ProductList(),
                  CategoryPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
