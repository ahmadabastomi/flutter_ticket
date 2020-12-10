part of 'services.dart';

class AuthServices {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<SignInSignUpResult> signUp(String email, String password,
      String name, List<String> selectedGenres, String selectedLanguage) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModels userModels = userCredential.user.converToUser(
          name: name,
          selectedGenres: selectedGenres,
          selectedLanguage: selectedLanguage);
      await UserServices.updateUser(userModels);
      return SignInSignUpResult(userModels: userModels);
    } on FirebaseAuthException catch (e) {
      return SignInSignUpResult(messages: e.code.toString());
    }
  }

  static Future<SignInSignUpResult> signIn(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      UserModels userModels = await userCredential.user.fromFireStore();
      return SignInSignUpResult(userModels: userModels);
    } on FirebaseAuthException catch (e) {
      print(e.toString());
      return SignInSignUpResult(messages: 'failed get data');
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }
}

class SignInSignUpResult {
  final UserModels userModels;
  final String messages;
  SignInSignUpResult({this.userModels, this.messages});
}
