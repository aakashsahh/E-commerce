import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ProductScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F6FD),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 15, right: 15),
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
                    child: Icon(Icons.arrow_back, size: 30),
                  ),
                  Text(
                    "Product",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Neumorphic(
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.concave,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(12)),
                      color: Color(0xFFF2F5FC),
                      intensity: 1,
                    ),
                    child: Padding(
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
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(5),
                child: Image.asset(
                  "assets/images/Product 1.png",
                  fit: BoxFit.cover,
                  height: 350,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Product Name",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: Text(
                      "\$230",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "Chairs",
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: Colors.black45),
              ),
              SizedBox(height: 20),
              Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.black45),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        decoration: BoxDecoration(
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
      ),
    );
  }
}
