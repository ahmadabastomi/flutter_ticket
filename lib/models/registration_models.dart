part of 'models.dart';

class RegistrationModels {
  String name;
  String email;
  String password;
  List<String> selectedGenres;
  String selectedLanguage;
  File profileImage;

  RegistrationModels(
      {this.name = "",
      this.email = "",
      this.password = "",
      this.selectedGenres = const [],
      this.selectedLanguage = "",
      this.profileImage});
}
