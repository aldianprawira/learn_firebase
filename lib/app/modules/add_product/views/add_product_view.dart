import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  const AddProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddProductView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller.namaC,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                labelText: "Nama Produk",
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.hargaC,
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                labelText: "Harga",
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => controller.addProduct(
                controller.namaC.text,
                controller.hargaC.text,
              ),
              child: const Text("Add product"),
            ),
          ],
        ),
      ),
    );
  }
}
