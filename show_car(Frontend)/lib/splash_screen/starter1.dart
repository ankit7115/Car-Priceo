import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Starter1 extends StatefulWidget {
  const Starter1({super.key});

  @override
  State<Starter1> createState() => _Starter1State();
}

class _Starter1State extends State<Starter1> {
  int active_index = 0;
  CarouselController cont = CarouselController();
  List<String> images = [
    'assets/images/welcome.jpg',
    'assets/images/welcome2.png',
    'assets/images/welcome3.png',
  ];
  List<String> title = [
    "Welcome To Car Priceo",
    "Get Car Price Easily",
    "Car Features"
  ];
  List<String> discription = [
    "Car Priceo is AI based car price prediction mobile app that will predict your old car current market price with the highest accuracy",
    "Get the best price prediction for your car just from your phone",
    "Entering all features in the features form will increase the chance of getting exact prediction for your car price"
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    Function() func = () {
      setState(() {
        cont.nextPage();
      });
    };
    Function() func2 = () {
      setState(() {
        cont.previousPage();
      });
    };
    Function() button_cont = () {
      Navigator.popAndPushNamed(context, '/home');
    };

    // print()

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: size.height / 28, vertical: size.height / 70),
          child: Column(
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: size.width / 3.5,
                          height: size.height / 10,
                          fit: BoxFit.fill,
                          color: Color.fromARGB(255, 18, 125, 175),
                        ),
                        // SizedBox(
                        //   width: 5,
                        // ),
                        Text(
                          "Car Priceo",
                          style: TextStyle(
                              fontSize:30,
                              fontFamily: 'Raleway',
                              color: Color.fromARGB(255, 18, 125, 175),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    active_index == 2
                        ? SizedBox()
                        : TextButton(
                            onPressed: button_cont,
                            child: Text(
                              'skip',
                              style: TextStyle(
                                fontSize:
                                    min(size.height / 38, size.width / 18.42),
                                fontFamily: 'Raleway',
                              ),
                            ))
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: CarouselSlider(
                        carouselController: cont,
                        options: CarouselOptions(
                          height: size.height / 1.4,
                          viewportFraction: 1,
                          enableInfiniteScroll: false,
                          autoPlay: false,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          onPageChanged: ((index, reason) {
                            setState(() {
                              active_index = index;
                            });
                            // print(index);
                          }),
                          aspectRatio: 0.5,
                        ),
                        items: [0, 1, 2].map((i) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  alignment: Alignment.center,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                          images[i],
                                          width: size.width / 1.086,
                                          height: size.height / 3,
                                          fit: BoxFit.fill,
                                          
                                        ),
                                        Text(
                                          title[i],
                                          style: TextStyle(
                                              fontSize: min(size.height / 21.8,
                                                  size.width / 11.87),
                                              fontFamily: 'RobotoMono',
                                              fontWeight: FontWeight.bold),
                                        ),
                                        
                                        Text(
                                          discription[i],
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: min(size.height / 43.75,
                                                  size.width / 23.75),
                                              fontFamily: 'RobotoMono'),
                                        ),
                                        
                                      ],
                                    ),
                                  ));
                            },
                          );
                        }).toList(),
                      ),
                    ),

                    Center(
                      child: AnimatedSmoothIndicator(
                        activeIndex: active_index,
                        count: 3,
                        onDotClicked: (count) => {cont.animateToPage(count)},
                        effect: ExpandingDotsEffect(
                          
                          dotColor: Colors.grey,
                          activeDotColor: Colors.blue,
                          dotWidth: size.width / 47.5,
                          dotHeight: size.height / 70,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: active_index == 0 ? null : func2,
                          child: Row(
                            children: [
                              Icon(Icons.arrow_back),
                              // Text("BACK", ),
                            ],
                          )),
                      ElevatedButton(
                         onPressed: active_index == 2 ? button_cont : func,
                          child: Row(children: [
                            active_index < 2
                                ?
                                
                                SizedBox()
                                : Text("CONTINUE"),
                            active_index < 2
                                ? Icon(Icons.arrow_forward)
                               
                                : SizedBox()
                          ])),
                    ]),
              ),
              SizedBox(
                height: size.height / 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
