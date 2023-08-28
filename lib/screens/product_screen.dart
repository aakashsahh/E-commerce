import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

import '../models/products_model.dart ';


class ProductScreen extends StatefulWidget {
  
  // ignore: prefer_typing_uninitialized_variables
  final product;
  const ProductScreen({required this.product, Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<Products> cartItems = [];
  @override
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F6FD),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back, size: 30),
                  ),
                  Text(
                    widget.product!['name'],
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Neumorphic(
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.concave,
                      boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                      color: const Color(0xFFF2F5FC),
                      intensity: 1,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Icons.favorite,
                        color: Colors.redAccent,
                        size: 30,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(5),
                child: Image.network(
                  widget.product!['imgurl'],
                  fit: BoxFit.cover,
                  height: 350,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.product!['name'],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      "\$${widget.product['price']}",
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                widget.product['category'],
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w300, color: Colors.black45),
              ),
              const SizedBox(height: 20),
              Text(
                widget.product['description'],
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: Colors.black45),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
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
        child: GestureDetector(
         
          child: const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "+Add To Cart",
                style: TextStyle(
                  color: Color(0xFF35324C),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          setState(() {
            cartItems.add(widget.product);
          });
        },
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFF35324C),
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                spreadRadius: 4,
              ),
            ],
          ),
          child: const Icon(
            CupertinoIcons.cart_badge_plus,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
