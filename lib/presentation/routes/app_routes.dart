import 'package:get/get.dart';
import '../pages/account_language_screen.dart';
import '../pages/add_language_dialog.dart';
import '../../utils/constants.dart';

class AppRoutes {
  static final routes = [
    GetPage(
        name: Constants.accountLanguageRoute,
        page: () =>  AccountLanguageScreen()),
    GetPage(
        name: Constants.addLanguageRoute,
        page: () => const AddLanguageDialog()),
  ];
}
