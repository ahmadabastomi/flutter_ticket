part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection = FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(UserModels userModels) async {
    try {
      await _userCollection.doc(userModels.id).set({
        'email': userModels.email,
        'name': userModels.name,
        'profilePicture': userModels.profilePicture ?? "",
        'selectedGenres': userModels.selectedGenres,
        'selectedLanguages': userModels.selectedLanguage,
        'balance': userModels.balance
      });
    } catch (e) {
      return print(e.toString());
    }
  }
}