import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equipment_request_app/domain/models/equipment_list.dart';
import 'package:equipment_request_app/presentation/employee_request_detail/view/employee_details_view.dart';
import 'package:equipment_request_app/presentation/request_equipment/view_model/request_equipment_view_model.dart';
import 'package:flutter/material.dart';

class EquipmentDetailView extends StatelessWidget {
  EquipmentDetailView(this.equipment, {super.key});

  final Equipment equipment;
  final viewModel = RequestEquipmentViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(equipment.equipmentCode),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(equipment.imageUrl),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.only(right: 40, left: 40, bottom: 20),
                child:
                Text(equipment.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                ),
              ),
              Text(equipment.specs,
                  style: Theme.of(context).textTheme.bodyMedium),
              StreamBuilder<QuerySnapshot>(
                stream: viewModel.getRequestInformation(equipment.equipmentCode),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }
                  if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Center(
                        child: CircularProgressIndicator());
                  }
                  if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                    final data = snapshot.requireData;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: data.size,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 30, left: 20),
                          child: ListTile(
                              title: Text("Requested By: ${data.docs[0]["lastname"]}, ${data.docs[0]["firstname"]}"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Purpose: ${data.docs[0]["purpose"]}"),
                                  Text("Schedule: ${data.docs[0]["schedule"]}"),
                                ],
                              )
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EmployeeDetailsView(equipment.equipmentCode.toString()),
                                ),
                              );
                            },
                            child: const Text('Request'),
                          ),
                        )
                    );
                  }
                  return Container();
                },
              )
            ],
          ),
        )
      ),
    );
  }
}
