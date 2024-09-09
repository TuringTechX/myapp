// lib/services/DataService.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class DataService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> fetchGlobalData() async {
    try {
      QuerySnapshot querySnapshot =
          await _firestore.collection('global_data').get();
      return querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList();
    } catch (error, stackTrace) {
      await FirebaseCrashlytics.instance.recordError(error, stackTrace);
      throw Exception('Failed to fetch global data');
    }
  }
}
