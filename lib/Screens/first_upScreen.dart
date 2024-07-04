import 'dart:math';

import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class CarItem {
  final String urlImage;
  final int horsepower;
  final double currentPrice;

  CarItem({required this.urlImage, required this.horsepower, required this.currentPrice});
}

class _HomepageState extends State<Homepage> {
  List<CarItem> cars = [
    CarItem(
      urlImage: 'assets/show/car2.jpg',
      horsepower: Random().nextInt(200) + 100,
      currentPrice: double.parse((Random().nextDouble() * 1.5 + 1).toStringAsFixed(1)),
    ),
    CarItem(
      urlImage: 'assets/show/car3.jpg',
      horsepower: Random().nextInt(200) + 100,
      currentPrice: double.parse((Random().nextDouble() * 1.5 + 1).toStringAsFixed(1)),
    ),
    CarItem(
      urlImage: 'assets/show/car4.jpg',
      horsepower: Random().nextInt(200) + 100,
      currentPrice: double.parse((Random().nextDouble() * 1.5 + 1).toStringAsFixed(1)),
    ),
    CarItem(
      urlImage: 'assets/show/car5.jpg',
      horsepower: Random().nextInt(200) + 100,
      currentPrice: double.parse((Random().nextDouble() * 1.5 + 1).toStringAsFixed(1)),
    ),
    CarItem(
      urlImage: 'assets/show/car6.jpg',
      horsepower: Random().nextInt(200) + 100,
      currentPrice: double.parse((Random().nextDouble() * 1.5 + 1).toStringAsFixed(1)),
    ),
    CarItem(
      urlImage: 'assets/show/car7.jpg',
      horsepower: Random().nextInt(200) + 100,
      currentPrice: double.parse((Random().nextDouble() * 1.5 + 1).toStringAsFixed(1)),
    ),
    CarItem(
      urlImage: 'assets/show/car8.jpg',
      horsepower: Random().nextInt(200) + 100,
      currentPrice: double.parse((Random().nextDouble() * 1.5 + 1).toStringAsFixed(1)),
    ),
    CarItem(
      urlImage: 'assets/show/car2.jpg',
      horsepower: Random().nextInt(200) + 100,
      currentPrice: double.parse((Random().nextDouble() * 1.5 + 1).toStringAsFixed(1)),
    ),
    CarItem(
      urlImage: 'assets/show/car3.jpg',
      horsepower: Random().nextInt(200) + 100,
      currentPrice: double.parse((Random().nextDouble() * 1.5 + 1).toStringAsFixed(1)),
    ),
    CarItem(
      urlImage: 'assets/show/car4.jpg',
      horsepower: Random().nextInt(200) + 100,
      currentPrice: double.parse((Random().nextDouble() * 1.5 + 1).toStringAsFixed(1)),
    ),
    CarItem(
      urlImage: 'assets/show/car5.jpg',
      horsepower: Random().nextInt(200) + 100,
      currentPrice: double.parse((Random().nextDouble() * 1.5 + 1).toStringAsFixed(1)),
    ),
    CarItem(
      urlImage: 'assets/show/car6.jpg',
      horsepower: Random().nextInt(200) + 100,
      currentPrice: double.parse((Random().nextDouble() * 1.5 + 1).toStringAsFixed(1)),
    ),
    CarItem(
      urlImage: 'assets/show/car7.jpg',
      horsepower: Random().nextInt(200) + 100,
      currentPrice: double.parse((Random().nextDouble() * 1.5 + 1).toStringAsFixed(1)),
    ),
    CarItem(
      urlImage: 'assets/show/car8.jpg',
      horsepower: Random().nextInt(200) + 100,
      currentPrice: double.parse((Random().nextDouble() * 1.5 + 1).toStringAsFixed(1)),
    ),

    // Add more cars here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Welcome to Car Showroom",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemCount: cars.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _showCarDetailsDialog(cars[index]);
            },
            child: Card(
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      cars[index].urlImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showCarDetailsDialog(CarItem car) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Car Details'),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                car.urlImage,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text(
                'Engine : ' + car.horsepower.toString() + "Hp",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 10),
              Text(
                'OnRoad Price ' + car.currentPrice.toString() + 'Cr',
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
