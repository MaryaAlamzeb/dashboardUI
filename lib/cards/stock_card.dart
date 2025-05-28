// stock_card.dart
import 'package:flutter/material.dart';

class StockCard extends StatelessWidget {
  final String title;
  final int total;
  final int above;
  final int below;
  final int notAvailable;

  const StockCard({
    required this.title,
    required this.total,
    required this.above,
    required this.below,
    required this.notAvailable,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isTotal = title == "Total";
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow:
            isTotal
                ? [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    offset: Offset(0, 2),
                  ),
                ]
                : null,
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Text(
            "Total Item\n$total",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _bar(above.toDouble() / total * 80, Colors.green),
                _bar(below.toDouble() / total * 80, Colors.orange),
                _bar(notAvailable.toDouble() / total * 80, Colors.red),
              ],
            ),
          ),
          const SizedBox(height: 6),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StockLegend(color: Colors.green, label: 'Above'),
              StockLegend(color: Colors.orange, label: 'Below'),
              StockLegend(color: Colors.red, label: 'Not'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _bar(double height, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Container(width: 8, height: height, color: color),
    );
  }
}

class StockLegend extends StatelessWidget {
  final Color color;
  final String label;

  const StockLegend({required this.color, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 6, height: 6, color: color),
        const SizedBox(width: 2),
        Text(label, style: const TextStyle(fontSize: 10)),
      ],
    );
  }
}
