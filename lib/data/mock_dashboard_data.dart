import 'package:flutter/material.dart';

class OrderInfo {
  final String label;
  final int value;
  final String amount;
  final Color color;

  OrderInfo({
    required this.label,
    required this.value,
    required this.amount,
    required this.color,
  });
}

final List<OrderInfo> orderInfoList = [
  OrderInfo(label: "Total Order", value: 100, amount: "₨ 50,000.00", color: Color(0xFFECF2FF)),
  OrderInfo(label: "Pending", value: 10, amount: "₨ 2,000.00", color: Color(0xFFFFF1D6)),
  OrderInfo(label: "Delivered", value: 40, amount: "₨ 3,000.00", color: Color(0xFFE5F9F1)),
  OrderInfo(label: "Not Delivered", value: 8, amount: "₨ 700.00", color: Color(0xFFFFF9E5)),
];
