import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hamro_furniture/models/products_model.dart';
import 'package:hamro_furniture/screens/cart_screen.dart';
import 'package:hamro_furniture/widgets/custom_navbar.dart';

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
  List<Products> cartItems = [];
  int _selectedIndex = -1;
  void navigateToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CartScreen(cartItems: cartItems.cast<Products>()),
      ),
    );
  }

  Stream<QuerySnapshot> products = FirebaseFirestore.instance.collection("Products").snapshots();
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
      bottomNavigationBar: CustomNavbar(onCartPressed: navigateToCart),
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
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    String category = categories[index];
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                        filterProducsts(category);
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

  void filterProducsts(String category) {
    setState(() {
      products = FirebaseFirestore.instance.collection("Products").where("category", isEqualTo: category).snapshots();
    });
  }

  Widget oneProduct(BuildContext context, product) {
    return Stack(
      children: [
        OverflowBox(
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        //for cart icon
        Padding(
          padding: const EdgeInsets.only(right: 0),
          child: Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: () {
                // Existing code...

                // Null checks for each field
                String id = product['id'] ?? '';
                String name = product['name'] ?? '';
                double price = (product['price'] ?? 0).toDouble();
                String description = product['description'] ?? '';
                String category = product['category'] ?? '';
                String imgurl = product['imgurl'] ?? '';
                int quantity = 1;

                // Map the snapshot data to the Products class
                Products productObject = Products(
                  id,
                  name,
                  price,
                  description,
                  category,
                  imgurl,
                  quantity,
                );

                setState(() {
                  cartItems.add(productObject);
                });
                print("hii");
                print(cartItems.length);
              },
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: const Color(0xFF35324C),
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        spreadRadius: 4,
                      )
                    ]),
                child: const Icon(
                  CupertinoIcons.cart_fill_badge_plus,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
