import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../widgets/custom_navbar.dart';
import '../widgets/products_widget.dart';
import 'category_screen.dart';

// ignore: must_be_immutable
class Homepage extends StatelessWidget {
  List categories = [
    "Chairs",
    "Sofas",
    "Beds",
    "Tables",
    "Doors",
    "Windows",
  ];

  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const CustomNavbar(),
        // body: DefaultTabController(
        //   length: 4,
        body: Material(
          color: const Color(0xFFF3F6FD),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 15),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  const Text(
                    "Hamro Furniture",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500, color: Colors.black54),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: InkWell(
                      onTap: () {},
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(12),
                          ),
                          color: const Color(0xFFF3F6FD),
                          intensity: 1,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.search),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () {},
                      child: Neumorphic(
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                            BorderRadius.circular(12),
                          ),
                          color: const Color(0xFFF3F6FD),
                          intensity: 1,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(
                            CupertinoIcons.person,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),

                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 360,
                  child: ProductsWidget(),
                ),
                const SizedBox(
                  height: 10,
                ),

                //categories box
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CategoryScreen(
                                  category: categories[index],
                                ), //navigate to category screen
                              ));
                        },
                        child: Neumorphic(
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                          style: NeumorphicStyle(
                            shape: NeumorphicShape.flat,
                            boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(20)),
                            color: const Color(0xFFF3F6FD),
                            intensity: 1,
                          ),
                          child: Center(
                              child: Text(
                            categories[index],
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.black,
                            ),
                          )),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Best Offers",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),

                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return ListTile(
                      minLeadingWidth: 70,
                      leading: Image.asset("assets/images/Product ${index + 1}.png"),
                      title: const Text(
                        "Product Name",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                      subtitle: Text(
                        categories[index],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                          color: Colors.black38,
                        ),
                      ),
                      trailing: const Text(
                        "\$230",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
                      ),
                    );
                  },
                ),
              ]),
            ),
          ),
        ));
    // ),
  }
}
