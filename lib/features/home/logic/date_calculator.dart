// Lógica de cálculo de prazos (date_calculator.dart)
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List<Widget> buildBoletosDates(DateTime selectedDate, List<int> intervals) {
  return intervals.isNotEmpty
      ? intervals.map((interval) {
    DateTime boletoDate = selectedDate.add(Duration(days: interval));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat('dd/MM/yyyy').format(boletoDate),
          style: const TextStyle(fontSize: 18),
        ),
        const Divider(),
      ],
    );
  }).toList()
      : [const Text('Nenhuma data disponível', style: TextStyle(fontSize: 18))];
}
