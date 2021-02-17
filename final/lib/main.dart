import 'package:flutter/material.dart';

void main() {
  runApp(TippiHedrunSavesTheDay());
}

class TippiHedrunSavesTheDay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tippi Hedrun Saves the Day',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TipCalculatorPage(),
    );
  }
}

class TipCalculatorPage extends StatelessWidget {
  TipCalculatorPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tippi Hedrun Saves the Day'),
      ),
      body: Center(
        child: Text(
          'Your bill is \$100.\nA tip of 15% is \$15\nmaking the total \$115',
        ),
      ),
    );
  }
}
