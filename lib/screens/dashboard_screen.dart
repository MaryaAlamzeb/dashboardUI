import 'package:flutter/material.dart';
import '../widgets/sidebar.dart';
import '../widgets/topbar.dart';
import '../cards/sales_pie_chart_card.dart';
import '../cards/order_delivery_payment_chart_card.dart';
import '../widgets/order_processing_info_grid.dart';
import '../widgets/stock_availability_table.dart';
import '../widgets/depo_stock_info_grid.dart';
import '../widgets/stock_availabilty_row.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = MediaQuery.of(context).size.width >= 900;

    return Scaffold(
      appBar:
          isDesktop
              ? null
              : AppBar(
                backgroundColor: Colors.white,
                elevation: 1,
                iconTheme: const IconThemeData(color: Colors.black87),
              ),
      drawer: isDesktop ? null : const Drawer(child: Sidebar()),
      body: Row(
        children: [
          if (isDesktop) const Sidebar(),
          Expanded(
            child: Column(
              children: [
                const TopBar(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(12),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final isWide = constraints.maxWidth > 900;

                        return Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            SizedBox(
                              width:
                                  isWide
                                      ? (constraints.maxWidth - 36) / 2
                                      : constraints.maxWidth,
                              child: const SalesPieChartCard(),
                            ), // ),
                            SizedBox(
                              width:
                                  isWide
                                      ? (constraints.maxWidth - 36) / 2
                                      : constraints.maxWidth,
                              child: const OrderDeliveryPaymentChartCard(),
                            ),
                            SizedBox(
                              width:
                                  isWide
                                      ? (constraints.maxWidth - 36) / 2
                                      : constraints.maxWidth,
                              child: const OrderProcessingInfoGrid(),
                            ),
                            SizedBox(
                              width:
                                  isWide
                                      ? (constraints.maxWidth - 36) / 2
                                      : constraints.maxWidth,
                              child: const StockAvailabilityTable(),
                            ),
                            SizedBox(
                              width:
                                  isWide
                                      ? constraints.maxWidth
                                      : double.infinity,
                              child: const DepoStockInfoGrid(),
                            ),

                            SizedBox(
                              width:
                                  isWide
                                      ? constraints.maxWidth
                                      : double.infinity,
                              child: const StockAvailabilityRow(),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
