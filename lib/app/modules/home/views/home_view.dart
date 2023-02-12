import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        backgroundColor: Colors.teal[900],
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          PopupMenuButton(
            onSelected: (value) {
              if (value == 0) {
                Get.toNamed(Routes.ADD_CONTACTS);
              } else if (value == 1) {}
            },
            itemBuilder: (context) => <PopupMenuEntry>[
              const PopupMenuItem(
                value: 0,
                child: Text("Add contact"),
              ),
              const PopupMenuItem(
                value: 1,
                child: Text("Settings"),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              color: Colors.teal[900],
              padding: const EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: const Text(
                "Dashboard Menu",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder(
        stream: controller.streamData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var listAllDocs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: listAllDocs.length,
              itemBuilder: (context, index) => ListTile(
                onTap: () => Get.toNamed(
                  Routes.EDIT_CONTACTS,
                  arguments: listAllDocs[index].id,
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                ),
                title: Text(
                    "${(listAllDocs[index].data() as Map<String, dynamic>)["name"]}"),
                subtitle: Text(
                    "${(listAllDocs[index].data() as Map<String, dynamic>)["phone"]}"),
                trailing: IconButton(
                  onPressed: () =>
                      controller.deleteContacts(listAllDocs[index].id),
                  icon: const Icon(Icons.delete),
                ),
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_CONTACTS),
        backgroundColor: Colors.teal[900],
        child: const Icon(Icons.add),
      ),
    );
  }
}
