import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SalesPieChartCard extends StatefulWidget {
  const SalesPieChartCard({super.key});

  @override
  State<SalesPieChartCard> createState() => _SalesPieChartCardState();
}

class _SalesPieChartCardState extends State<SalesPieChartCard> {
  int selectedIndex = 0; // 0: Monthly, 1: Quarterly, 2: Yearly

  final List<Color> pieColors = [
    Color(0xFF45C07A), // Sales
    Color(0xFF2A99E3), // Collection
    Color(0xFFFFB02E), // Due
  ];

  final List<Map<String, dynamic>> pieData = [
    {"title": "Sales", "value": 4560, "percent": 45.6},
    {"title": "Collection", "value": 3480, "percent": 34},
    {"title": "Due", "value": 2160, "percent": 21.5},
  ];

  List<PieChartSectionData> getPieSections() {
    return List.generate(pieData.length, (index) {
      final data = pieData[index];
      return PieChartSectionData(
        color: pieColors[index],
        value: data['value'].toDouble(),
        title: '',
        radius: 50,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isWide = constraints.maxWidth > 500;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Sales, Collection & Due",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        backgroundColor: Color(0xFFE5F1FB),
                      ),
                      child: const Text(
                        "Change Depo",
                        style: TextStyle(color: Color(0xFF2A99E3)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Toggle
                ToggleButtons(
                  isSelected: [
                    selectedIndex == 0,
                    selectedIndex == 1,
                    selectedIndex == 2,
                  ],
                  onPressed: (int index) {
                    setState(() => selectedIndex = index);
                  },
                  borderRadius: BorderRadius.circular(8),
                  selectedColor: Colors.white,
                  fillColor: const Color(0xFF2A99E3),
                  color: Colors.black87,
                  constraints: const BoxConstraints(
                    minHeight: 32,
                    minWidth: 90,
                  ),
                  children: const [
                    Text('Monthly'),
                    Text('Quarterly'),
                    Text('Yearly'),
                  ],
                ),
                const SizedBox(height: 20),

                // Pie + Legend
                Flex(
                  direction: isWide ? Axis.horizontal : Axis.vertical,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Chart
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: PieChart(
                        PieChartData(
                          sections: getPieSections(),
                          centerSpaceRadius: 0,
                          sectionsSpace: 2,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20, height: 16),

                    // Legend
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(pieData.length, (index) {
                        final data = pieData[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: pieColors[index],
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text("${data['title']}"),
                              const SizedBox(width: 8),
                              Text(
                                "${data['value']}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "(${data['percent']}%)",
                                style: TextStyle(
                                  color: pieColors[index],
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
