import 'package:flutter/material.dart';

class StockItem {
  final String name;
  final int quantity;
  final String value;
  final String status;
  final Color statusColor;

  StockItem({
    required this.name,
    required this.quantity,
    required this.value,
    required this.status,
    required this.statusColor,
  });
}

final List<StockItem> stockItems = [
  StockItem(
    name: 'Cecevi 250 mg',
    quantity: 100,
    value: '₨ 1,500.00',
    status: 'Above Threshold',
    statusColor: Color(0xFF45C07A),
  ),
  StockItem(
    name: 'Cecevi 250 mg',
    quantity: 200,
    value: '₨ 1,400.00',
    status: 'No Refill',
    statusColor: Color(0xFFFF5C5C),
  ),
  StockItem(
    name: 'Cecevi 250 mg',
    quantity: 52,
    value: '₨ 15,400.00',
    status: 'Above Threshold',
    statusColor: Color(0xFF45C07A),
  ),
  StockItem(
    name: 'Cecevi 250 mg',
    quantity: 152,
    value: '₨ 15,400.00',
    status: 'Below Threshold',
    statusColor: Color(0xFFFFC107),
  ),
];
