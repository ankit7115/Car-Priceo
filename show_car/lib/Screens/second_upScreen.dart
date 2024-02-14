// ignore: file_names
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../car/car_data.dart';

class Predictor extends StatefulWidget {
  const Predictor({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _PredictorState createState() => _PredictorState();
}

class _PredictorState extends State<Predictor> {
  final TextEditingController kmController = TextEditingController();
  String selectedCar = '';
  String selectedModel = '';
  int selectedYear = DateTime.now().year;
  String selectedFuelType = '';
  String newpredictionResult = '';

  Future<void> sendDataToDjango() async {
    final response = await http.post(
      Uri.parse("http://10.0.2.2:8000/predictions/receive_data/"),
      body: jsonEncode({
        'carName': selectedCar,
        'carModel': selectedModel,
        'year': selectedYear,
        'fuel_type': selectedFuelType,
        'km_driven': kmController.text,
      }),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      final predictionResult = responseData['predictionResult'];
      setState(() {
        newpredictionResult = 'Prediction Result: $predictionResult';
      });
    } else {
      print('Error sending data to Django: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        title:const Text("Car Price Predictions", style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.amber[50],
      ),
      body:Container(
        
        decoration:const BoxDecoration (
          image: DecorationImage(
            image: AssetImage('assets/images/logo.png',),
             opacity: 1,
            fit: BoxFit.cover,
          ),
          color: const Color.fromARGB(221, 177, 176, 176),
        ),
        child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: SingleChildScrollView(
                    child: DropdownButton<String>(
                      isExpanded: true,
                    value: selectedCar.isNotEmpty ? selectedCar : null,
                    hint:const Text('Select Car'),
                    //  style: const TextStyle(color: Colors.black,backgroundColor: Colors.white), // Set text color
                    // elevation: 10, // Adjust dropdown elevation
                    icon: const Icon(Icons.car_crash,color: Color.fromARGB(255, 26, 8, 8)), // Set dropdown arrow icon
                    iconSize: 24, // Adjust dropdown arrow icon size
                    onChanged: (value) {
                      setState(() {
                        selectedCar = value ?? '';
                        selectedModel = '';
                      });
                    },
                    items: cars.map((car) {
                      return DropdownMenuItem<String>(
                        value: car.name,
                        child: Text(car.name,
                        // style: const TextStyle(
                        //   fontWeight: FontWeight.bold,
                        //   // color:  Color.fromARGB(255, 255, 254, 254), // Set dropdown item text color
                        // ),
                        ), 
                      );
                    }).toList(),
                   ),
                  ),
                ),
                const SizedBox(height: 10),
                if (selectedCar.isNotEmpty)
                SingleChildScrollView(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedModel.isNotEmpty ? selectedModel : null,
                    hint:const Text('Select Model'),
                    onChanged: (value) {
                      setState(() {
                        selectedModel = value ?? '';
                      });
                    },
                    items: cars
                        .firstWhere((car) => car.name == selectedCar)
                        .models
                        .map((model) {
                      return DropdownMenuItem<String>(
                        value: model,
                        child: Text(model),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 10),
                SingleChildScrollView(
                  child: DropdownButton<int>(
                    isExpanded: true,
                    icon: const Icon(Icons.calendar_month),
                  value: selectedYear,
                  hint:const Text('Select Year'),
                  onChanged: (value) {
                    setState(() {
                      selectedYear = value!;
                    });
                  },
                  items: List.generate(
                    50, // You can adjust the range of years as needed
                    (index) => DropdownMenuItem<int>(
                      value: DateTime.now().year - index,
                      child: Text('${DateTime.now().year - index}'),
                    ),
                  ),
                          ),
                ),
        
                const SizedBox(height: 10),
                SingleChildScrollView(
                  child: DropdownButton<String>(
                    isExpanded: true,
                     icon: const Icon(Icons.oil_barrel_rounded),
                  value: selectedFuelType.isNotEmpty ? selectedFuelType : null,
                  hint:const Text('Select Fuel Type'),
                  onChanged: (value) {
                    setState(() {
                      selectedFuelType = value ?? '';
                    });
                  },
                  items: ['Petrol', 'Diesel', 'LPG'].map((fuelType) {
                    return DropdownMenuItem<String>(
                      value: fuelType,
                      child: Text(fuelType),
                    );
                  }).toList(),
                          ),
                ),
        
                const SizedBox(height: 10),
                TextField(
                  controller: kmController,
                  decoration:const InputDecoration(labelText: 'Km Driven',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await sendDataToDjango();
                  },
                  child:const Text('Predict'),
                ),
                const SizedBox(height: 20),
                Text(
                  newpredictionResult,
                  style:const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
      ),
    );
  }
}