import 'package:assignment/presentation/controller/language_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'data/repositories/language_repository_impl.dart';
import 'domain/use_cases/add_language_use_case.dart';
import 'presentation/routes/app_routes.dart';
import 'utils/constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  final repository = LanguageRepositoryImpl();
  final addLanguageUseCase = AddLanguageUseCase(repository);
  Get.put(LanguageController(addLanguageUseCase: addLanguageUseCase));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Language Manager',
      initialRoute: Constants.accountLanguageRoute,
      getPages: AppRoutes.routes,
    );
  }
}
