// lib/services/HealthcareService.dart
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class HealthcareService {
  final String _baseUrl = 'https://api.example.com';
  final bool useMockData = true;

  Future<Map<String, dynamic>> fetchHealthRecommendations() async {
    try {
      if (useMockData) {
        final String response = await rootBundle
            .loadString('lib/assets/mock_health_recommendations.json');
        return jsonDecode(response);
      } else {
        final response =
            await http.get(Uri.parse('$_baseUrl/health-recommendations'));
        if (response.statusCode == 200) {
          return jsonDecode(response.body);
        } else {
          throw Exception('Failed to load health recommendations');
        }
      }
    } catch (error, stackTrace) {
      await FirebaseCrashlytics.instance.recordError(error, stackTrace);
      throw error;
    }
  }
}
