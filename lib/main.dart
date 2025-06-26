import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/pet_detail_screen.dart';
import 'screens/pet_list_screen.dart';

void main() => runApp(const PetShopApp());

class PetShopApp extends StatelessWidget {
  const PetShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PetCare',
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/details': (context) => const PetDetailScreen(),
        '/registros': (context) => const PetListScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
