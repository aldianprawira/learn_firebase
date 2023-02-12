import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_contacts_controller.dart';

class AddContactsView extends GetView<AddContactsController> {
  const AddContactsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add contact'),
        backgroundColor: Colors.teal[900],
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller.nameC,
              autocorrect: false,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: "Name",
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                prefixIcon: const Icon(Icons.add),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.phoneC,
              autocorrect: false,
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                labelText: "Phone",
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                prefixIcon: const Icon(Icons.phone),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => controller.addContacts(
                controller.nameC.text,
                controller.phoneC.text,
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[900],
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: const Text("Add contact"),
            ),
          ],
        ),
      ),
    );
  }
}
