import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equipment_request_app/domain/models/equipment_list.dart';
import 'package:equipment_request_app/presentation/equipment/view_model/equipment_list_view_model.dart';
import 'package:equipment_request_app/presentation/request_equipment/view/request_equipment_view.dart';
import 'package:flutter/material.dart';

class EquipmentListView extends StatelessWidget {
  EquipmentListView({super.key});

  final viewModel = EquipmentListViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Equipment List'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    StreamBuilder<QuerySnapshot>(
                      stream: viewModel.getEquipmentStream(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Something went wrong');
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (snapshot.hasData) {
                          final data = snapshot.requireData;
                          return Expanded(
                            child: ListView.builder(
                              itemCount: data.size,
                              itemBuilder: (context, index) {
                                final equipment = Equipment();
                                equipment.equipmentCode = data.docs[index]['equipment_code'];
                                equipment.description =
                                data.docs[index]['description'];
                                equipment.specs = data.docs[index]['specs'];
                                equipment.imageUrl = data.docs[index]['image_url'];
                                return Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: ListTile(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => EquipmentDetailView(equipment),
                                          ),
                                        );
                                      },
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(equipment.imageUrl),
                                      ),
                                      title: Text(equipment.equipmentCode),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(equipment.specs),
                                          Text(
                                            equipment.description,
                                            maxLines: 3,),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        }
                        return Container();
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
