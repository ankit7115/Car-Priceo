import 'dart:math';

import 'package:flutter/material.dart';
import 'package:show_car/Screens/first_upScreen.dart';
import 'package:show_car/Screens/second_upScreen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height * 0.6,
          width: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/show/car1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height * 0.08),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png'),
                Expanded(
                  child: Text(
                    "Car Priceo",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        decoration: TextDecoration.none,
                        fontSize: min(size.height / 15, size.width / 8.14)),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(246, 245, 245, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.55,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  color: Color.fromARGB(199, 230, 227, 227),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            0,
                            MediaQuery.of(context).size.height * 0.07,
                            0,
                            MediaQuery.of(context).size.height * 0.045),
                        child: Text(
                          "  This is Car Priceo",
                          style: TextStyle(
                            fontFamily: 'Russo One',
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            decoration: TextDecoration.none,
                            fontSize: min(size.height / 20, size.width / 10.9),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            MediaQuery.of(context).size.width * 0.07,
                            0,
                            MediaQuery.of(context).size.width * 0.07,
                            0),
                        child: Text(
                          textAlign: TextAlign.center,
                          "Get accurate car valuations instantly with our machine learning-powered Car Price Prediction app. Just input the required data and get reliable estimates based on factors such as company and model, date of manufacturing, fuel type, and travelled history.",
                          style: styles(size,),
                          
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.08),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Material(
                                elevation: 5.0,
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10.0),
                                child: MaterialButton(
                                  onPressed: () {
                                    onTap:
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Homepage()),
                                    );
                                  },
                                  minWidth:
                                      MediaQuery.of(context).size.width / 2 * 0.8,
                                  height: MediaQuery.of(context).size.height * 0.08,
                                  child: Text(
                                    'Car Showroom',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              Material(
                                elevation: 5.0,
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10.0),
                                child: MaterialButton(
                                  onPressed: () {
                                    onTap:
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Predictor()),
                                    );
                                  },
                                  minWidth:
                                      MediaQuery.of(context).size.width / 2 * 0.8,
                                  height: MediaQuery.of(context).size.height * 0.08,
                                  child: Text(
                                    'Priceo Predictor',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  TextStyle styles(size) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      color: Colors.black,
      decoration: TextDecoration.none,
      fontSize: min(size.height / 50, size.height / 27.2),
    );
  }
}
