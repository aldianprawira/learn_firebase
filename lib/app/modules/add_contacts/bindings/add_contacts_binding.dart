import 'package:get/get.dart';
import '../controllers/add_contacts_controller.dart';

class AddContactsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddContactsController>(
      () => AddContactsController(),
    );
  }
}
