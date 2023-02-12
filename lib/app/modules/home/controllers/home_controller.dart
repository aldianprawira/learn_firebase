import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference contacts = firestore.collection("contacts");
    return contacts.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference contacts = firestore.collection("contacts");
    return contacts.snapshots();
  }

  void deleteContacts(String docID) {
    DocumentReference docRef = firestore.collection("contacts").doc(docID);

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
