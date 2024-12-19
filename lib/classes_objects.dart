import 'package:flutter/material.dart';

class Car {
  final String name;
  final String year;
  final String engineDetails;
  final String location;
  final String imageUrl;
  final int price;
  final int monthlyPayment;
  int mileage;
  int maxSpeed;

  Car({
    this.name = 'Unknown Car',
    this.year = 'Unknown Year',
    this.engineDetails = 'Unknown Engine',
    this.location = 'Unknown Location',
    this.imageUrl = 'https://example.com/default-car.jpg',
    this.price = 0,
    this.monthlyPayment = 0,
    this.mileage = 0,
    this.maxSpeed = 0,
  });

  // Convert kilometers to miles
  void convertToMiles() {
    mileage = (mileage * 0.621371).round();
    maxSpeed = (maxSpeed * 0.621371).round();
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Catalog',
      home: CarsCatalogPage(),
    );
  }
}

class CarsCatalogPage extends StatelessWidget {
  final List<Car> cars = [
    Car(
      name: 'Lexus ES 300h',
      year: '2021 г.',
      engineDetails: '2.5 л, гибрид, КПП вариатор',
      location: 'Алматы',
      imageUrl: 'https://wehco.media.clients.ellingtoncms.com/timesfreepress/img/photos/2016/02/19/1455939952_Lexus8218.jpg', // Укажите URL изображения
      price: 25400000,
      monthlyPayment: 585129,
      mileage: 45000,
      maxSpeed: 240,
    ),
    Car(
      name: 'Li L9',
      year: '2024',
      engineDetails: '1.5 л, бензин, КПП автомат',
      location: 'Алматы',
      imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/4/4b/Lixiang_L9_Sanming_01_2023-02-07.jpg',
      price: 31500000,
      monthlyPayment: 584575,
      mileage: 25000,
      maxSpeed: 250,
    )
    
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('kolesa.kz')),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          final car = cars[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CarDetailPage(car: car),
                ),
              );
            },
            child: Card(
              elevation: 3,
              margin: EdgeInsets.all(8),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image Section
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        car.imageUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 12),
                    // Details Section
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            car.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${car.year}, ${car.engineDetails}',
                            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                          ),
                          Text(
                            'С пробегом ${car.mileage} км',
                            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                          ),
                          SizedBox(height: 8),
                          Text(
                            car.location,
                            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${car.price} ₸',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 4,
                                  horizontal: 8,
                                ),
                                color: Colors.yellow,
                                child: Text(
                                  '${car.monthlyPayment} ₸/мес',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class CarDetailPage extends StatefulWidget {
  final Car car;

  CarDetailPage({required this.car});

  @override
  _CarDetailPageState createState() => _CarDetailPageState();
}

class _CarDetailPageState extends State<CarDetailPage> {
  bool isKilometers = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.car.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                widget.car.imageUrl,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Год выпуска: ${widget.car.year}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Характеристики: ${widget.car.engineDetails}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Цена: ${widget.car.price} ₸',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Месячный платеж: ${widget.car.monthlyPayment} ₸/мес',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Пробег: ${widget.car.mileage} ${isKilometers ? 'км' : 'миль'}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Максимальная скорость: ${widget.car.maxSpeed} ${isKilometers ? 'км/ч' : 'миль/ч'}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Локация: ${widget.car.location}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (isKilometers) {
                      widget.car.convertToMiles();
                    }
                    isKilometers = !isKilometers;
                  });
                },
                child: Text(isKilometers ? 'Показать в милях' : 'Показать в километрах'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
