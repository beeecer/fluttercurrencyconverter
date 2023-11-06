import 'package:flutter/material.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tip Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TipCalculator(),
    );
  }
}

class TipCalculator extends StatefulWidget {
  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  TextEditingController billAmountController = TextEditingController();
  double tipPercentage = 0.15;
  double tipAmount = 0;

  void calculateTip() {
    double billAmount = double.tryParse(billAmountController.text) ?? 0;
    setState(() {
      tipAmount = billAmount * tipPercentage;
    });
  }

  void selectServiceLevel(double percentage) {
    setState(() {
      tipPercentage = percentage;
      calculateTip();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip Calculator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Enter Bill Amount:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Container(
              width: 150,
              child: TextField(
                controller: billAmountController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    selectServiceLevel(0.15);
                  },
                  child: Text('Normal Service'),
                ),
                ElevatedButton(
                  onPressed: () {
                    selectServiceLevel(0.20);
                  },
                  child: Text('Outstanding Service'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Tip Amount: \$${tipAmount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
