import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class OrderDeliveryPaymentChartCard extends StatelessWidget {
  const OrderDeliveryPaymentChartCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: const Color(0xFFF6FAFD),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Order, Delivery & Payment",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.more_horiz),
                  color: Colors.grey[600],
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Chart Area
            SizedBox(
              height: 150,
              child: LineChart(
                LineChartData(
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, _) {
                          final months = [
                            'JAN',
                            'FEB',
                            'MAR',
                            'APR',
                            'MAY',
                            'JUN',
                            'JUL',
                            'AUG',
                            'SEP',
                            'OCT',
                            'NOV',
                            'DEC',
                          ];
                          return Text(
                            value.toInt() >= 0 && value.toInt() < months.length
                                ? months[value.toInt()]
                                : '',
                            style: const TextStyle(fontSize: 10),
                          );
                        },
                        interval: 1,
                      ),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  gridData: FlGridData(show: true),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      color: const Color(0xFF2A99E3),
                      barWidth: 2,
                      dotData: FlDotData(show: false),
                      spots: const [
                        FlSpot(0, 30),
                        FlSpot(1, 45),
                        FlSpot(2, 40),
                        FlSpot(3, 60),
                        FlSpot(4, 80),
                        FlSpot(5, 70),
                        FlSpot(6, 90),
                        FlSpot(7, 100),
                        FlSpot(8, 80),
                        FlSpot(9, 75),
                        FlSpot(10, 95),
                        FlSpot(11, 110),
                      ],
                    ),
                    LineChartBarData(
                      isCurved: true,
                      color: const Color(0xFFFFB02E),
                      barWidth: 2,
                      dotData: FlDotData(show: false),
                      spots: const [
                        FlSpot(0, 20),
                        FlSpot(1, 25),
                        FlSpot(2, 28),
                        FlSpot(3, 40),
                        FlSpot(4, 50),
                        FlSpot(5, 65),
                        FlSpot(6, 70),
                        FlSpot(7, 85),
                        FlSpot(8, 60),
                        FlSpot(9, 65),
                        FlSpot(10, 60),
                        FlSpot(11, 72),
                      ],
                    ),
                    LineChartBarData(
                      isCurved: true,
                      color: const Color(0xFF45C07A),
                      barWidth: 2,
                      dotData: FlDotData(show: false),
                      spots: const [
                        FlSpot(0, 10),
                        FlSpot(1, 18),
                        FlSpot(2, 30),
                        FlSpot(3, 35),
                        FlSpot(4, 40),
                        FlSpot(5, 45),
                        FlSpot(6, 50),
                        FlSpot(7, 65),
                        FlSpot(8, 62),
                        FlSpot(9, 70),
                        FlSpot(10, 75),
                        FlSpot(11, 80),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Legend
            Wrap(
              spacing: 24,
              runSpacing: 12,
              children: const [
                _LegendItem(color: Color(0xFF2A99E3), label: 'Order'),
                _LegendItem(color: Color(0xFFFFB02E), label: 'Delivery'),
                _LegendItem(color: Color(0xFF45C07A), label: 'Payment'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String label;

  const _LegendItem({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 6),
        Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[700])),
      ],
    );
  }
}
