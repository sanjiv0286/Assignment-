import '../entities/language_entity.dart';

abstract class LanguageRepository {
  List<LanguageEntity> getLanguages();
  void addLanguage(LanguageEntity language);
}
