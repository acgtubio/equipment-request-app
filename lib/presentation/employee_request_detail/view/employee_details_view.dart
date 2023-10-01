import 'package:equipment_request_app/presentation/employee_request_detail/view_model/employee_details_view_model.dart';
import 'package:flutter/material.dart';

class EmployeeDetailsView extends StatelessWidget {
  EmployeeDetailsView(this.equipmentCode, {super.key});

  final viewModel = RequestEmployeeDetailsViewModel();
  final String equipmentCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: viewModel.employeeDetailsFormKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: viewModel.firstnameController,
                decoration: const InputDecoration(labelText: 'First Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: viewModel.lastnameController,
                decoration: const InputDecoration(labelText: 'Last Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: viewModel.purposeController,
                decoration: const InputDecoration(labelText: 'Purpose'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: viewModel.scheduleController,
                decoration: const InputDecoration(labelText: 'Schedule'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (viewModel.employeeDetailsFormKey.currentState!.validate()) {
                    viewModel.addRequestEmployeeDetails(equipmentCode);
                    Navigator.pop(context);
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      )
    );
  }
}
