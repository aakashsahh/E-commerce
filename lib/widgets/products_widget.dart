import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';


class ProductsWidget extends StatefulWidget {
  const ProductsWidget({super.key});

  @override
  State<ProductsWidget> createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  // final Stream<QuerySnapshot> products =
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: SizedBox(
              width: 250,
              child: Stack(
                children: [
                  SizedBox(
                    height: 320,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: () {
                                },
                                child: Image.asset(
                                  "assets/images/Product ${index + 1}.png",
                                  height: 250,
                                  width: 250,
                                  fit: BoxFit.cover,
                                )),
                            const Text("Product name",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                )),
                            const SizedBox(height: 8),
                            const Text(
                              "\$230",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  //for cart icon
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {},
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
              ),
            ),
          );
        });
  }
}
