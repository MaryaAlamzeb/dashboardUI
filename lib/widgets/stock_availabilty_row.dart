import 'package:flutter/material.dart';
import '../cards/stock_card.dart';

class StockAvailabilityRow extends StatelessWidget {
  const StockAvailabilityRow({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> cards = List.generate(10, (index) {
      final isTotal = index == 0;
      return StockCard(
        title: isTotal ? 'Total' : 'Depo $index',
        total: 1000,
        above: 300,
        below: 132,
        notAvailable: 568,
      );
    });

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF6FAFD),
        borderRadius: BorderRadius.circular(12),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          const int columnCount = 5;
          const double spacing = 12;
          final double cardWidth =
              (constraints.maxWidth - (spacing * (columnCount - 1))) /
              columnCount;

          return Column(
            children: List.generate(2, (rowIndex) {
              return Padding(
                padding: EdgeInsets.only(bottom: rowIndex == 1 ? 0 : spacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(columnCount, (colIndex) {
                    final int cardIndex = rowIndex * columnCount + colIndex;
                    return Padding(
                      padding: EdgeInsets.only(
                        right: colIndex == columnCount - 1 ? 0 : spacing,
                      ),
                      child: SizedBox(
                        width: cardWidth,
                        height: 180,
                        child: cards[cardIndex],
                      ),
                    );
                  }),
                ),
              );
            }),
          );
        },
      ),
    );
  }
}
