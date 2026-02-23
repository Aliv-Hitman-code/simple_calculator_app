import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "calculator",
      home: CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({super.key});

  @override
  State<CalculatorHome> createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondControlller = TextEditingController();
  String result = "";
  void calculate(String symbol) {
    double first = double.tryParse(firstController.text) ?? 0;
    double second = double.tryParse(secondControlller.text) ?? 0;
    if (firstController.text.isNotEmpty &&
        secondControlller.text.isNotEmpty &&
        second != 0) {
      double calculation = 0.0;
      if (symbol == '+') {
        calculation = first + second;
        setState(() {
          result =
              "The addition of $first and $second is : ${calculation.toStringAsFixed(2)}";
        });
      }
      if (symbol == '-') {
        calculation = first - second;
        setState(() {
          result =
              "The subtraction of $first and $second is : ${calculation.toStringAsFixed(2)}";
        });
      }
      if (symbol == '*') {
        calculation = first * second;
        setState(() {
          result =
              "The multiplication of $first and $second is : ${calculation.toStringAsFixed(2)}";
        });
      }
      if (symbol == '/') {
        calculation = first / second;
        setState(() {
          result =
              "The division of $first and $second is : ${calculation.toStringAsFixed(2)}";
        });
      }
    } else if (second == 0 && symbol == '/') {
      setState(() {
        result = "Undefined Behavior";
      });
    } else if (firstController.text.isEmpty && secondControlller.text.isEmpty) {
      setState(() {
        result = "Enter a valid value";
      });
    }
  }

  @override
  void dispose() {
    firstController.dispose();
    secondControlller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "C A L C U L A T O R",
          style: TextStyle(
            color: Colors.white,
            fontSize: 50,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent[100],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: firstController,
              decoration: InputDecoration(
                labelText: "Enter your first number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: secondControlller,
              decoration: InputDecoration(
                labelText: "Enter your second number",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    calculate("+");
                  },
                  child: Text("Addition"),
                ),
                ElevatedButton(
                  onPressed: () {
                    calculate("-");
                  },
                  child: Text("Subtraction"),
                ),
                ElevatedButton(
                  onPressed: () {
                    calculate("*");
                  },
                  child: Text("Multiplication"),
                ),
                ElevatedButton(
                  onPressed: () {
                    calculate("/");
                  },
                  child: Text("Divison"),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              result,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
