import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pawpal/app/widgets/appbar.dart';
import '../../../widgets/part/drawer.dart';
import '../controllers/dashboard_admin_controller.dart';


class DashboardAdminView extends GetView<DashboardAdminController> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = context.width;
    final isSmallScreen = screenWidth < 1100;
    return Scaffold(
      appBar: isSmallScreen
          ? PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: SafeArea(child: MyAppbarAdmin()),
            )
          : null,
      drawer: isSmallScreen
          ? MyDrawerAdmin(
              activeRoute: ModalRoute.of(context)?.settings.name ?? "")
          : null,
      body: Row(
        children: [
          if (!isSmallScreen)
            SizedBox(
              width: 300,
              child: MyDrawerAdmin(
                  activeRoute: ModalRoute.of(context)?.settings.name ?? ""),
            ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildStatCard(
                              "Total Users", controller.totalUsers.value),
                          _buildStatCard(
                              "Active Users", controller.activeUsers.value),
                          _buildStatCard(
                              "Total Layanan", controller.totalLayanan.value),
                        ],
                      )),
                  const SizedBox(height: 20),
                  const Text(
                    'Layanan Over Time',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Obx(() => LineChart(
                          LineChartData(
                            lineBarsData: [
                              LineChartBarData(
                                spots: [
                                  FlSpot(0,
                                      controller.totalUsers.value.toDouble()),
                                  FlSpot(1,
                                      controller.activeUsers.value.toDouble()),
                                  FlSpot(2,
                                      controller.totalLayanan.value.toDouble()),
                                ],
                                isCurved: true,
                                color: Colors.blue,
                                barWidth: 4,
                                isStrokeCapRound: true,
                              ),
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, int value) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              value.toString(),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
