import 'package:flutter/material.dart';
class Splash1 extends StatelessWidget {
  const Splash1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Image.asset('assets/images/logo.png',
              color: const Color.fromRGBO(255, 255, 255, 1),
              height : 500,
              width: 100,
              fit: BoxFit.fill),
        ),
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
