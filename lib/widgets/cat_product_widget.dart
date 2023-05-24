

import 'package:hamro_furniture/screens/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CatProductCard extends StatelessWidget {
  int pIndex;
  CatProductCard(this.pIndex);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Neumorphic(
          style: NeumorphicStyle(
            shape: NeumorphicShape.flat,
            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
            color: const Color(0xFFF3F6FD),
            intensity: 1,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductScreen(),
                        ));
                  },
                  child: Image.asset(
                    "assets/images/Product ${pIndex + 1}.png",
                    height: 150,
                    width: 150,
                  ),
                ),
                const Text(
                  "Product Name",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.black54),
                ),
                const SizedBox(height: 10),
                const Text(
                  "\$230",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                )
              ],
            ),
          ),
        ));
  }
}
