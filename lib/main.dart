
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(CalculadoraPrazosApp());
}

class CalculadoraPrazosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de Prazos de Pagamento',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculadoraPrazosHomePage(),
    );
  }
}

class CalculadoraPrazosHomePage extends StatefulWidget {
  @override
  _CalculadoraPrazosHomePageState createState() =>
      _CalculadoraPrazosHomePageState();
}

class _CalculadoraPrazosHomePageState extends State<CalculadoraPrazosHomePage> {
  DateTime selectedDate = DateTime.now();
  String selectedPrazo = '14/28/42';
  List<int> intervals = [14, 28, 42];
  final List<String> prazos = ['14/28/42', '14/28/42/56', '28/42/56'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de Prazos de Pagamento'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selecione a data inicial:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: DateFormat('dd/MM/yyyy').format(selectedDate),
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Selecione o prazo:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            DropdownButton<String>(
              value: selectedPrazo,
              onChanged: (String? newValue) {
                setState(() {
                  selectedPrazo = newValue!;
                  intervals = selectedPrazo.split('/').map(int.parse).toList();
                });
              },
              items: prazos.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _calculateDates,
              child: Text('Calcular Datas de Boletos'),
            ),
            SizedBox(height: 16),
            Text(
              'Datas dos boletos:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            ..._buildBoletosDates(),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  void _calculateDates() {
    setState(() {});
  }

  List<Widget> _buildBoletosDates() {
    return intervals.map((interval) {
      DateTime boletoDate = selectedDate.add(Duration(days: interval));
      return Text(
        DateFormat('dd/MM/yyyy').format(boletoDate),
        style: TextStyle(fontSize: 18),
      );
    }).toList();
  }
}