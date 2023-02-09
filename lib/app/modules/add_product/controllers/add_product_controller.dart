import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  late TextEditingController namaC;
  late TextEditingController hargaC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addProduct(String nama, String harga) async {
    CollectionReference products = firestore.collection("products");

    try {
      await products.add({
        "nama": nama,
        "harga": harga,
      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menambahkan produk",
        onConfirm: () => Get.back(),
        textConfirm: "Okay",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Gagal",
        middleText: "Gagal menambahkan produk",
      );
    }
  }

  @override
  void onInit() {
    namaC = TextEditingController();
    hargaC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    namaC.dispose();
    hargaC.dispose();
    super.onClose();
  }
}
