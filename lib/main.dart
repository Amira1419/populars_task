import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squadio_task/providers/popular_details_provider.dart';
import 'package:squadio_task/ui/screens/popular_list.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<PopularDetailsProvider>(create: (_) => PopularDetailsProvider(),)
    ],
    child: const MyApp())
    );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FAMOUS APP',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Colors.lightBlue.shade900,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PopularListScreen();
  }
}
