import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../car/car_data.dart';

class Predictor extends StatefulWidget {
  const Predictor({Key? key}) : super(key: key);
  @override
  _PredictorState createState() => _PredictorState();
}

class _PredictorState extends State<Predictor> {
  final TextEditingController kmController = TextEditingController();
  String selectedCar = '';
  String selectedModel = '';
  int selectedYear = DateTime.now().year;
  String selectedFuelType = '';
  int? predictionResult;
  bool isLoading = false;
  String errormsg = "";

  bool validateInputs() {
  return selectedCar.isNotEmpty &&
         selectedModel.isNotEmpty &&
         selectedFuelType.isNotEmpty &&
         kmController.text.isNotEmpty;
  }
  Future<void> sendDataToDjango() async {
    FocusScope.of(context).unfocus();

    setState(() {
      isLoading = true;
    });

    final response = await http.post(
      Uri.parse("https://car-priceo.onrender.com/predictions/receive_data/"),
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
      final floatPredictionResult = responseData['predictionResult'];
      setState(() {
        predictionResult = floatPredictionResult.toInt(); // Convert float to int
        isLoading = false;
      });
    } else {
      print('Error sending data to Django: ${response.statusCode}');
      setState(() {
        errormsg = "Error in backend";
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0.0,
          title: Text(
            "Prediction",
            style: TextStyle(color: Colors.white),
          ),
          // centerTitle: true,
          backgroundColor: Colors.amber[50],
          // Adding logo to appBar
          flexibleSpace: Container(
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.contain,
              ),
            ),
          ),
      ),
        body: Padding(
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
                  onChanged: (newValue){
                    setState(() {});
                  },
                  controller: kmController,
                  decoration:const InputDecoration(labelText: 'Km Driven',
                  ),
                  keyboardType: TextInputType.number,
                ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: isLoading || !validateInputs()? null : () async {
                  await sendDataToDjango();
                },
                child: Text('Predict'),
              ),
              const SizedBox(height: 20),
              if (isLoading)
                const Center(
                        child: CircularProgressIndicator(),
                      ),
              if (predictionResult != null && !isLoading) // Show prediction result only if available
                Text(
                  "Prediction Result: $predictionResult" + errormsg,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
            ],
          ),
        ),
      );
  }
}
