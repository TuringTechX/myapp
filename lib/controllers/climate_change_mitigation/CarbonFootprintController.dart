import 'package:flutter/material.dart';
import '../../models/CarbonFootprintModel.dart';
import '../../services/CarbonTrackingService.dart';
import '../../utils/GHGCalculator.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class CarbonFootprintController with ChangeNotifier {
  final CarbonTrackingService _carbonTrackingService = CarbonTrackingService();
  CarbonFootprintModel _carbonFootprintModel = CarbonFootprintModel();
  FirebaseAnalytics _analytics = FirebaseAnalytics();

  double get carbonFootprint => _carbonFootprintModel.totalEmissions;
  List<String> get offsetProjects => _carbonFootprintModel.offsetProjects;
  bool isLoading = false;

  Future<void> calculateFootprint(
      double transport, double energyConsumption, double waste) async {
    try {
      isLoading = true;
      notifyListeners();

      // Calculate carbon footprint using GHGCalculator utility
      double calculatedFootprint = GHGCalculator.calculateTotalEmissions(
        transport: transport,
        energy: energyConsumption,
        waste: waste,
      );
      _carbonFootprintModel.totalEmissions = calculatedFootprint;

      // Log event to Firebase Analytics
      await _analytics.logEvent(
        name: 'calculate_carbon_footprint',
        parameters: {
          'transport': transport,
          'energyConsumption': energyConsumption,
          'waste': waste,
          'totalEmissions': calculatedFootprint,
        },
      );

      notifyListeners();
    } catch (e, stack) {
      await FirebaseCrashlytics.instance.recordError(e, stack);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchRealTimeCarbonFootprint() async {
    try {
      isLoading = true;
      notifyListeners();

      // Fetch real-time carbon footprint data from service
      CarbonFootprintModel realTimeData =
          await _carbonTrackingService.getCarbonFootprint();
      _carbonFootprintModel = realTimeData;

      // Log event to Firebase Analytics
      await _analytics.logEvent(
        name: 'fetch_real_time_carbon_footprint',
        parameters: {
          'totalEmissions': realTimeData.totalEmissions,
          'energyEmissions': realTimeData.energyEmissions,
          'transportEmissions': realTimeData.transportEmissions,
        },
      );

      notifyListeners();
    } catch (e, stack) {
      await FirebaseCrashlytics.instance.recordError(e, stack);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> participateInOffset(String project) async {
    try {
      isLoading = true;
      notifyListeners();

      // Add offset project to the model
      _carbonFootprintModel.addOffsetProject(project);

      // Log offset participation to Firebase Analytics
      await _analytics.logEvent(
        name: 'participate_in_offset',
        parameters: {'project': project},
      );

      notifyListeners();
    } catch (e, stack) {
      await FirebaseCrashlytics.instance.recordError(e, stack);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> reduceCarbonFootprint() async {
    try {
      isLoading = true;
      notifyListeners();

      // Call the service to reduce the carbon footprint
      await _carbonTrackingService.reduceFootprint();

      // Recalculate footprint after reduction
      await fetchRealTimeCarbonFootprint();

      // Log event to Firebase Analytics
      await _analytics.logEvent(
        name: 'reduce_carbon_footprint',
        parameters: {'newTotalEmissions': _carbonFootprintModel.totalEmissions},
      );
    } catch (e, stack) {
      await FirebaseCrashlytics.instance.recordError(e, stack);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
