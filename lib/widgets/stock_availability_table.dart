import 'package:flutter/material.dart';
import '../data/mock_stock_data.dart';

class StockAvailabilityTable extends StatelessWidget {
  const StockAvailabilityTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: const Color(0xFFF6FAFD),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Stock Availability Details',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Icon(Icons.more_horiz),
              ],
            ),
            const SizedBox(height: 16),

            // Table content
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: const BoxConstraints(minWidth: 600),
                child: DataTable(
                  columnSpacing: 24,
                  horizontalMargin: 0,
                  dataRowMinHeight: 44,
                  dataRowMaxHeight: 56,
                  dividerThickness: 0.6,
                  columns: const [
                    DataColumn(label: Text('Item Name')),
                    DataColumn(label: Text('Quantity')),
                    DataColumn(label: Text('Value')),
                    DataColumn(label: Text('Status')),
                  ],
                  rows:
                      stockItems.map((item) {
                        return DataRow(
                          cells: [
                            DataCell(Text(item.name)),
                            DataCell(Text('${item.quantity}')),
                            DataCell(Text(item.value)),
                            DataCell(
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: item.statusColor.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  item.status,
                                  style: TextStyle(
                                    color: item.statusColor,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                ),
              ),
            ),

            // Footer (Pagination)
            const SizedBox(height: 16),
            const Row(
              children: [
                Text("Rows per page: 10"),
                Spacer(),
                Icon(Icons.chevron_left, size: 20),
                SizedBox(width: 4),
                Text("1 of 2"),
                SizedBox(width: 4),
                Icon(Icons.chevron_right, size: 20),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
