part of 'extensions.dart';

extension FirebaseUserExtension on User { //FirebaseUser rename to User
  UserModels converToUser(
          {String name = "No Name",
          List<String> selectedGenres = const [],
          String selectedLanguage = "English",
          int balance = 50000}) =>
      UserModels(this.uid, this.email,
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage,
          balance: balance);
          
  Future<UserModels> fromFireStore() async => await UserServices.getUser(this.uid);
}
