import 'package:flutter/material.dart';
import 'features/home/presentation/pages/home_page.dart';

void main() {
  runApp(const CalculadoraPrazosApp());
}

class CalculadoraPrazosApp extends StatelessWidget {
  const CalculadoraPrazosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Prazos de Pagamento',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculadoraPrazosHomePage(),
    );
  }
}
