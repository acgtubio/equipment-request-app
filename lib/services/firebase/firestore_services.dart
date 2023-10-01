import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FireStoreServices {
  FireStoreServices();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addRequestEmployeeDetail(
      String equipmentCode, String lastname, String firstname, String purpose, String schedule) async {
    final Map<String, dynamic> data = <String, dynamic>{
      'equipment_code': equipmentCode,
      'lastname': lastname,
      'firstname': firstname,
      'purpose': purpose,
      'schedule': schedule
    };

    final DocumentReference documentReferencer = _firestore
        .collection('requested_equipment')
        .doc();

    await documentReferencer.set(data).whenComplete(() {
      if (kDebugMode) {
        print('grocery added to the database');
      }
    }).catchError((e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    });
  }
}
