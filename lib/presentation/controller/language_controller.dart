
import 'package:get/get.dart';
import 'package:assignment/domain/use_cases/add_language_use_case.dart';

class LanguageController extends GetxController {
  final AddLanguageUseCase addLanguageUseCase;
  var selectedLanguages = <String>[].obs;

  LanguageController({required this.addLanguageUseCase});

  void toggleLanguageSelection(String language) {
    if (selectedLanguages.contains(language)) {
      selectedLanguages.remove(language);
    } else {
      selectedLanguages.add(language);
    }
  }

  List<String> getAvailableLanguages() {
    return [
      'English',
      'French',
      'Urdu',
      'Malayalam',
      'Spanish',
      'Konkini',
      'Tamil',
      'Portuguese',
      'Kannada',
      'Hindi',
      'Korean',
      'Ksgii'
    ];
  }
}
