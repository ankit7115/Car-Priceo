import 'package:flutter/material.dart';
class Splash1 extends StatelessWidget {
  const Splash1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          "Car Priceo",
          style: TextStyle(
              fontSize: 50,
              fontFamily: 'Raleway',
              color: Color.fromRGBO(255, 255, 255, 1),
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
