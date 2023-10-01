import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// import '../../../services/firebase/authentication.dart';
// import '../../../services/firebase/firestore_services.dart';

class RequestEquipmentViewModel {

  Stream<QuerySnapshot> getRequestInformation(String equipmentCode) {
    return FirebaseFirestore.instance
        .collection('requested_equipment')
        .where("equipment_code", isEqualTo: equipmentCode)
        .snapshots();
  }

}
