import 'dart:convert';
import 'dart:io';
import 'package:firebase_crashlytics/firebase_crashlytics.dart'; // Import Firebase Crashlytics
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class RealTimeDataService {
  final String _baseUrl = 'https://api.example.com';
  final bool useMockData = true;

  Future<List<String>> fetchRealTimeUpdates() async {
    try {
      if (useMockData) {
        final String response = await rootBundle
            .loadString('lib/assets/mock_real_time_updates.json');
        List<dynamic> data = jsonDecode(response);
        return data.cast<String>();
      } else {
        final response =
            await http.get(Uri.parse('$_baseUrl/real-time-updates'));
        if (response.statusCode == 200) {
          List<dynamic> data = jsonDecode(response.body);
          return data.cast<String>();
        } else {
          throw HttpException('Failed to load real-time updates',
              uri: Uri.parse('$_baseUrl/real-time-updates'));
        }
      }
    } catch (error, stackTrace) {
      // Log the error to Firebase Crashlytics
      await FirebaseCrashlytics.instance.recordError(error, stackTrace);
      print('Error fetching real-time updates: $error');
      throw error; // Rethrow the error to be handled by the UI layer
    }
  }

  // Fetch key metrics from API or mock data
  Future<Map<String, String>> fetchKeyMetrics() async {
    try {
      if (useMockData) {
        final String response =
            await rootBundle.loadString('lib/assets/mock_key_metrics.json');
        Map<String, dynamic> data = jsonDecode(response);
        return data.cast<String, String>();
      } else {
        final response = await http.get(Uri.parse('$_baseUrl/key-metrics'));
        if (response.statusCode == 200) {
          Map<String, dynamic> data = jsonDecode(response.body);
          return data.cast<String, String>();
        } else {
          throw HttpException('Failed to load key metrics',
              uri: Uri.parse('$_baseUrl/key-metrics'));
        }
      }
    } catch (error, stackTrace) {
      // Log the error to Firebase Crashlytics
      await FirebaseCrashlytics.instance.recordError(error, stackTrace);
      print('Error fetching key metrics: $error');
      throw error;
    }
  }

  // Additional methods...
}
