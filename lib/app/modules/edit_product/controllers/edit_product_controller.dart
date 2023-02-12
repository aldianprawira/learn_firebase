import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditProductController extends GetxController {
  late TextEditingController namaC;
  late TextEditingController hargaC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection("products").doc(docID);
    return docRef.get();
  }

  void editProduct(String nama, String harga, String docID) async {
    DocumentReference docData = firestore.collection("products").doc(docID);

    try {
      await docData.update({
        "nama": nama,
        "harga": harga,
      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data produk",
        onConfirm: () {
          namaC.clear();
          hargaC.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "Okay",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Gagal",
        middleText: "Gagal mengubah data produk",
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
