import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// import '../../../services/firebase/authentication.dart';
// import '../../../services/firebase/firestore_services.dart';

class EquipmentListViewModel {
  // final firebaseAuth = Authentication(FirebaseAuth.instance);
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final quantityController = TextEditingController();
  final imageUrlController = TextEditingController();
  final groceryFormkey = GlobalKey<FormState>();

  Stream<QuerySnapshot> getEquipmentStream() {
    return FirebaseFirestore.instance
        .collection('equipment_list')
        .snapshots();
  }

}
