import '../entities/language_entity.dart';
import '../repositories/language_repository.dart';

class AddLanguageUseCase {
  final LanguageRepository repository;

  AddLanguageUseCase(this.repository);

  void call(LanguageEntity language) {
    repository.addLanguage(language);
  }
}
