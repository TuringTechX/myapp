// lib/screens/CarbonFootprintScreen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/climate_change_mitigation/CarbonFootprintController.dart';
import '../widgets/CarbonChartWidget.dart';

class CarbonFootprintScreen extends StatelessWidget {
  final CarbonFootprintController controller = Get.put(CarbonFootprintController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carbon Footprint'),
      ),
      body: Obx(() {
        if (controller.isLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Column(
            children: [
              CarbonChartWidget(
                totalEmissions: controller.carbonFootprint,
                transportEmissions: controller._carbonFootprintModel.transportEmissions,
                energyEmissions: controller._carbonFootprintModel.energyEmissions,
                wasteEmissions: controller._carbonFootprintModel.wasteEmissions,
              ),
              ElevatedButton(
                onPressed: () async {
                  await controller.reduceCarbonFootprint();
                },
                child: Text('Reduce Carbon Footprint'),
              ),
              ElevatedButton(
                onPressed: () async {
                  // Example of participating in an offset project
                  await controller.participateInOffset('Reforestation Project');
                },
                child: Text('Participate in Offset Project'),
              ),
            ],
          );
        }
      }),
    );
  }
}
