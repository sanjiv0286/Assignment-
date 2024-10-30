import '../../domain/entities/language_entity.dart';
import '../../domain/repositories/language_repository.dart';

class LanguageRepositoryImpl implements LanguageRepository {
  final List<LanguageEntity> _languages = [];

  @override
  List<LanguageEntity> getLanguages() => _languages;

  @override
  void addLanguage(LanguageEntity language) {
    _languages.add(language);
  }
}
