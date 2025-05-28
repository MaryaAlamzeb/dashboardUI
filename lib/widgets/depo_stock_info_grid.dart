import 'package:flutter/material.dart';
import '../cards/depo_stock_card.dart';

class DepoStockInfoGrid extends StatelessWidget {
  const DepoStockInfoGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<DepoStockCard> cards = [
      const DepoStockCard(
        title: 'Total',
        available: '135 items',
        inTransit: '135 items',
        isTotal: true,
      ),
      for (int i = 1; i <= 9; i++)
        DepoStockCard(
          title: 'Depo $i',
          available: '135 items',
          inTransit: '135 items',
        ),
    ];

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF6FAFD),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          const double minCardWidth = 180;
          const double spacing = 12;

          int columnCount = (constraints.maxWidth / (minCardWidth + spacing))
              .floor()
              .clamp(1, 5);

          final double calculatedWidth =
              (constraints.maxWidth - spacing * (columnCount - 1)) /
              columnCount;

          return Wrap(
            spacing: spacing,
            runSpacing: spacing,
            children:
                cards.map((card) {
                  return SizedBox(width: calculatedWidth, child: card);
                }).toList(),
          );
        },
      ),
    );
  }
}
