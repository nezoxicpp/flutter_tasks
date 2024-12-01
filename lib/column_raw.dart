import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Column and Row',
      home: ColumnRawPage(),
    );
  }
}

class ColumnRawPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Column and Row'),
        centerTitle: true,
        backgroundColor: Colors.grey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('First'),
          const Text('Second'),
          const Text('Third'),
          const SizedBox(height: 20),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.favorite,
                color: Colors.pink,
                size: 24.0,
              ),
              SizedBox(width: 10),
              Icon(
                Icons.audiotrack,
                color: Colors.purple,
                size: 30.0,
              ),
              SizedBox(width: 10),
              Icon(
                Icons.beach_access,
                color: Colors.blue,
                size: 36.0,
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 100,
                color: Colors.red,
              ),
            ],
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Flutter'),
                  Icon(Icons.star)
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('data'),
                  Icon(Icons.accessibility)
                ],
              )
            ],
          ),
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                color: Colors.green,
              ),
              const Spacer(),
              Container(
                width: 50,
                height: 50,
                color: Colors.green,
              ),
              Expanded(
                flex: 2,
                child: Container(color: Colors.blue, height: 50),
              )
            ],
          )
        ],
      ),
    );
  }
}
