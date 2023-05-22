import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../widgets/products_widget.dart';
import 'category_screen.dart';

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
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          decoration: const BoxDecoration(
              color: Color(0xFFF3F6FD),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  spreadRadius: 2,
                ),
              ]),
          height: 70,
          child: Row(children: []),
        ),
      ),
      body: DefaultTabController(
        length: 4,
        child: Material(
          color: const Color(0xFFF3F6FD),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 50, left: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Hamro Furniture",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.black54),
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
                                    CupertinoIcons.cart_fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]),
                    const SizedBox(
                      height: 20,
                    ),
                    const TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        indicatorColor: Colors.black,
                        isScrollable: true,
                        labelColor: Colors.black,
                        labelStyle: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        unselectedLabelColor: Colors.black38,
                        tabs: [
                          Tab(
                            text: "chairs",
                          ),
                          Tab(
                            text: "Sofas",
                          ),
                          Tab(
                            text: "Beds",
                          ),
                          Tab(
                            text: "Tables",
                          ),
                        ]),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 360,
                      child: TabBarView(children: [
                        ProductsWidget(),
                        ProductsWidget(),
                        ProductsWidget(),
                        ProductsWidget(),
                      ]),
                    ),
                    const SizedBox(height: 10),
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
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 25),
                              style: NeumorphicStyle(
                                shape: NeumorphicShape.flat,
                                boxShape: NeumorphicBoxShape.roundRect(
                                    BorderRadius.circular(20)),
                                color: Color(0xFFF3F6FD),
                                intensity: 1,
                              ),
                              child: Center(
                                  child: Text(
                                categories[index],
                                style: TextStyle(
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
                    SizedBox(height: 12),
                    Text(
                      "Best Offers",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return ListTile(
                          minLeadingWidth: 70,
                          leading: Image.asset(
                              "assets/images/Product ${index + 1}.png"),
                          title: Text(
                            "Product Name",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black54,
                            ),
                          ),
                          subtitle: Text(
                            categories[index],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color: Colors.black38,
                            ),
                          ),
                          trailing: Text(
                            "\$230",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        );
                      },
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
