import 'package:cloud_firestore/cloud_firestore.dart';

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
