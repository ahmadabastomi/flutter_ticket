part of 'services.dart';

class UserServices {
  static CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  static Future<void> updateUser(UserModels userModels) async {
    try {
      await _userCollection.doc(userModels.id).set({
        'email': userModels.email,
        'name': userModels.name,
        'profilePicture': userModels.profilePicture ?? "",
        'selectedGenres': userModels.selectedGenres,
        'selectedLanguage': userModels.selectedLanguage,
        'balance': userModels.balance
      });
    } catch (e) {
      return print(e.toString());
    }
  }

  static Future<UserModels> getUser(String id) async {
    try {
      DocumentSnapshot snapshot = await _userCollection.doc(id).get();
      Map<String, dynamic> data = snapshot.data();

      return UserModels(id, data['email'],
          name: data['name'],
          profilePicture: data['profilePicture'],
          selectedGenres: (data['selectedGenres'] as List).map((e) => e.toString()).toList(),
          selectedLanguage: data['selectedLanguage'],
          balance: data['balance']);
    } catch (e) {
      return null;
    }
  }
}
