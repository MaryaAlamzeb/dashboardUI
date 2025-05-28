import 'package:flutter/material.dart';
import '../data/mock_dashboard_data.dart';

class OrderProcessingInfoCard extends StatelessWidget {
  final OrderInfo info;

  const OrderProcessingInfoCard({super.key, required this.info});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: info.color,
        borderRadius: BorderRadius.circular(12),
      ),

      // padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${info.value}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(info.label, style: const TextStyle(fontSize: 14)),
          const SizedBox(height: 6),
          Text(
            info.amount,
            style: const TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
