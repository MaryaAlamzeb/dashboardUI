import 'package:flutter/material.dart';

class DepoStockCard extends StatelessWidget {
  final String title;
  final String available;
  final String inTransit;
  final bool isTotal;

  const DepoStockCard({
    super.key,
    required this.title,
    required this.available,
    required this.inTransit,
    this.isTotal = false,
  });

  @override
  Widget build(BuildContext context) {
    final Color bgColor =
        isTotal ? const Color(0xFF2A99E3) : const Color(0xFFF8FBFD);
    final Color textColor = isTotal ? Colors.white : Colors.black87;
    final Color subColor = isTotal ? Colors.white70 : Colors.black54;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: isTotal ? null : Border.all(color: Colors.black12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and optional 'Details'
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (!isTotal)
                Text(
                  'Details',
                  style: TextStyle(color: Colors.blue[400], fontSize: 12),
                ),
            ],
          ),

          const SizedBox(height: 12),

          // Available and In Transit stacked vertically (to fix overflow)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Available',
                style: TextStyle(fontSize: 12, color: subColor),
              ),
              Text(
                available,
                style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
              ),
              const SizedBox(height: 8),
              Text(
                'In Transit',
                style: TextStyle(fontSize: 12, color: subColor),
              ),
              Text(
                inTransit,
                style: TextStyle(fontWeight: FontWeight.bold, color: textColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
