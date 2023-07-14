import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hamro_furniture/screens/home2.dart';


class CustomNavbar extends StatelessWidget {
  final VoidCallback onCartPressed;

  const CustomNavbar({super.key, required this.onCartPressed});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.transparent,
                blurRadius: 4,
                spreadRadius: 2,
              ),
            ]),
        height: 60,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  // Navigator.pushAndRemoveUntil<void>(
                  //   context,
                  //   MaterialPageRoute<void>(builder: (BuildContext context) => const Homepage2()),
                  //   ModalRoute.withName('home'),
                  // );
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(
                    Icons.home_filled,
                    color: Colors.black,
                    size: 28,
                  ),
                ),
              ),
              InkWell(
                onTap: onCartPressed,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(
                    CupertinoIcons.cart_fill,
                    color: Colors.black,
                    size: 28,
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.black,
                    size: 28,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
