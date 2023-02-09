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
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => const ListTile(
          title: Text("Produk"),
          subtitle: Text("Harga"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_PRODUCT),
        child: const Icon(Icons.add),
      ),
    );
  }
}
