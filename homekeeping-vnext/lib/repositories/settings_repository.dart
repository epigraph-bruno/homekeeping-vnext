import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:homekeeping/models/settings.dart';

class SettingsRepository {
  final FirebaseFirestore _firestore;

  SettingsRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  // Watch settings changes
  Stream<AppSettings> watchSettings() {
    return _firestore
        .collection('settings')
        .doc('current')
        .snapshots()
        .map((doc) => AppSettings.fromJson(doc.data()!));
  }

  // Get current settings
  Future<AppSettings> getSettings() async {
    final doc = await _firestore
        .collection('settings')
        .doc('current')
        .get();

    return AppSettings.fromJson(doc.data()!);
  }
}