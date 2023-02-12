import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddContactsController extends GetxController {
  late TextEditingController nameC;
  late TextEditingController phoneC;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addContacts(String name, String phone) async {
    CollectionReference contacts = firestore.collection("contacts");

    try {
      await contacts.add({
        "name": name,
        "phone": phone,
      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menambahkan kontak",
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
        middleText: "Gagal menambahkan kontak",
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
