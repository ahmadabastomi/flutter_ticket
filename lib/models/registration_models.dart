part of 'models.dart';

class RegistrationModels {
  final String name;
  final String email;
  final String password;
  final List<String> selectedGenres;
  final String selectedLanguage;
  final File profileImage;

  RegistrationModels(
      {this.name = "",
      this.email = "",
      this.password = "",
      this.selectedGenres = const [],
      this.selectedLanguage = "",
      this.profileImage});
}
