import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference products = firestore.collection("products");
    return products.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference products = firestore.collection("products");
    return products.snapshots();
  }

  void deleteProduct(String docID) {
    DocumentReference docRef = firestore.collection("products").doc(docID);

    try {
      Get.defaultDialog(
        title: "Delete",
        middleText: "Apakah Anda yakin menghapus data produk?",
        onConfirm: () async {
          await docRef.delete();
          Get.back();
        },
        textConfirm: "Ya",
        textCancel: "Tidak",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Gagal",
        middleText: "Gagal menghapus data produk",
      );
    }
  }
}
