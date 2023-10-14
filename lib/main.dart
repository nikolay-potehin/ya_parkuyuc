import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ya_parkuyuc/pages/home_page.dart';
import 'package:ya_parkuyuc/src/providers/hack_provider.dart';
import 'package:ya_parkuyuc/src/providers/points_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => HackProvider()),
        Provider(create: (context) => PointsProvider()),
      ],
      child: MaterialApp(
        title: 'ЯПаркуюсь',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
