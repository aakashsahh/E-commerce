import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../widgets/cat_product_widget.dart';

class CategoryScreen extends StatelessWidget {
  String category;
  CategoryScreen({required this.category});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Color(0xFFF3F6FD),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    category,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  Neumorphic(
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.concave,
                      boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(12),
                      ),
                      color: const Color(0xFFF3F6FD),
                      intensity: 1,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(CupertinoIcons.cart_fill),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 30),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.only(top: 20, right: 5,left: 5,bottom: 50),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
            childAspectRatio: (MediaQuery.of(context).size.width - 15 - 10) / (2 * 250),
            mainAxisSpacing: 30,
            crossAxisSpacing: 5,
          ),
          itemCount: 4,
          itemBuilder: (context, index){
            if(index % 2 == 0){
              return CatProductCard(index);
            }
            return OverflowBox(
              maxHeight: 250 +70,
              child: Container(
                margin: EdgeInsets.only(top: 70),
                child: CatProductCard(index),
              ),
            );
          },
          ),
          ],
        ),
      ),
    );
  }
}
