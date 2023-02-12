import 'package:get/get.dart';
import '../controllers/edit_contacts_controller.dart';

class EditContactsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditContactsController>(
      () => EditContactsController(),
    );
  }
}
