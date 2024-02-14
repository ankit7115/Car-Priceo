import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class CardItem {
  final String urlImage;
  const CardItem({required this.urlImage});
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Welcome to Car Showroom",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.pink[100],
      ),
      body: Container(
        height: 350,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => buildCard(index),
          separatorBuilder: (context, index) => SizedBox(width: 5),
          itemCount: 7,
        ),
      ),
    );
  }

  Widget buildCard(int cnt) {
    return Container(
      width: 375, // Adjust the width as needed
      child: Image.asset(
        'assets/show/car${cnt + 2}.jpg', // Correct the image path
        fit: BoxFit.cover,
      ),
    );
  }
}
