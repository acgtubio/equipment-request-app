import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// import '../../../services/firebase/authentication.dart';
import '../../../services/firebase/firestore_services.dart';

class RequestEmployeeDetailsViewModel {
  // final firebaseAuth = Authentication(FirebaseAuth.instance);
  final firstnameController = TextEditingController();
  final lastnameController = TextEditingController();
  final purposeController = TextEditingController();
  final scheduleController = TextEditingController();
  final employeeDetailsFormKey = GlobalKey<FormState>();

  Stream<QuerySnapshot> getEquipmentStream() {
    return FirebaseFirestore.instance
        .collection('equipment_list')
        .snapshots();
  }

  Future<void> addRequestEmployeeDetails(String equipmentCode) async{
    final fireStoreService = FireStoreServices();

    fireStoreService.addRequestEmployeeDetail(equipmentCode, lastnameController.text, firstnameController.text, purposeController.text, scheduleController.text);
  }

}
