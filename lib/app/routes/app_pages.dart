import 'package:get/get.dart';

import '../modules/add_contacts/bindings/add_contacts_binding.dart';
import '../modules/add_contacts/views/add_contacts_view.dart';
import '../modules/edit_contacts/bindings/edit_contacts_binding.dart';
import '../modules/edit_contacts/views/edit_contacts_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_CONTACTS,
      page: () => const AddContactsView(),
      binding: AddContactsBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_CONTACTS,
      page: () => const EditContactsView(),
      binding: EditContactsBinding(),
    ),
  ];
}
