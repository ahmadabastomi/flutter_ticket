import 'package:flutter/material.dart';
import 'package:flutter_ticket/services/services.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('SignUp'),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () async {
                      SignInSignUpResult result = await AuthServices.signUp(
                          "barry@example.com",
                          "SuperSecretPassword!",
                          "Tomms",
                          ["action", "horror", "crime", "mystery"],
                          "English");

                      if (result == null) {
                        print(result.messages);
                      } else {
                        print(result.userModels.toString());
                      }
                    },
                    child: Text('SignUp'),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RaisedButton(
                    onPressed: () async {
                      SignInSignUpResult result = await AuthServices.signIn(
                          "barry1@example.com",
                          "SuperSecretPassword!");
                      if (result.userModels == null) {
                        print(result.messages);
                      } else {
                        print(result.userModels.toString());
                      }
                    },
                    child: Text('SignIn'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
