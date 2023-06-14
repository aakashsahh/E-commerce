import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hamro_furniture/widgets/custom_navbar.dart';

import 'category_screen.dart';
import 'product_screen.dart';

class Homepage2 extends StatefulWidget {
  const Homepage2({Key? key}) : super(key: key);

  @override
  State<Homepage2> createState() => _Homepage2State();
}

class _Homepage2State extends State<Homepage2> {
  List categories = [
    "Chairs",
    "Sofas",
    "Beds",
    "Tables",
    "Doors",
    "Windows",
  ];
  int _selectedIndex = -1;
  final Stream<QuerySnapshot> products = FirebaseFirestore.instance.collection("Products").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Hamro Furniture",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.all(20),
            onPressed: () {},
            icon: const Icon(Icons.person),
            iconSize: 30,
            color: Colors.black,
          )
        ],
      ),
      bottomNavigationBar: const CustomNavbar(),
      body: Material(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => CategoryScreen(
                        //       category: categories[index],
                        //     ),
                        //   ),
                        // );
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: _selectedIndex == index ? Colors.black : const Color(0xFFF3F6FD),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            categories[index],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: _selectedIndex == index ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              StreamBuilder<QuerySnapshot>(
                stream: products,
                builder: (
                  BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot,
                ) {
                  if (snapshot.hasError) {
                    return const Text('Error');
                  } else if (snapshot.hasData) {
                    return GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(right: 5, left: 5, bottom: 40),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: (MediaQuery.of(context).size.width - 15 - 10) / (2 * 250),
                        mainAxisSpacing: 30,
                        crossAxisSpacing: 5,
                      ),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var product = snapshot.data!.docs[index].data();
                        return oneProduct(context, product);
                      },
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget oneProduct(BuildContext context, product) {
    return OverflowBox(
      maxHeight: 320,
      child: Container(
        margin: const EdgeInsets.only(top: 40),
        child: Padding(
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
                          builder: (context) => ProductScreen(
                            product: product,
                          ),
                        ),
                      );
                    },
                    child: Image.network(
                      product['imgurl'],
                      height: 150,
                      width: 150,
                    ),
                  ),
                  Text(
                    product['name'],
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black54),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "\$${product['price']}",
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
