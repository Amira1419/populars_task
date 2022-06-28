import 'package:flutter/material.dart';
import 'package:squadio_task/network/popular_people.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FAMOUS APP',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        primaryColor: Colors.lightGreen.shade100,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PopularPeopleNetwork.getPagePopularPeople(1);
    return Scaffold(
      appBar: AppBar(
        
        title: const Text("FAMOUS"),
      ),
      body: Center(
        
        child: Column(
          children: <Widget>[
            Text('get data')
          ],
        ),
      ),
    );
  }
}
