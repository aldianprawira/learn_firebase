import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditContactsController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController phoneC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot<Object?>> getData(String docID) async {
    DocumentReference docRef = firestore.collection("contacts").doc(docID);
    return docRef.get();
  }

  void editContacts(String name, String phone, String docID) async {
    DocumentReference docData = firestore.collection("contacts").doc(docID);

    try {
      await docData.update({
        "name": name,
        "phone": phone,
      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data kontak",
        onConfirm: () {
          nameC.clear();
          phoneC.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "Okay",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Gagal",
        middleText: "Gagal mengubah data kontak",
      );
    }
  }

  @override
  void onInit() {
    nameC = TextEditingController();
    phoneC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    nameC.dispose();
    phoneC.dispose();
    super.onClose();
  }
}
