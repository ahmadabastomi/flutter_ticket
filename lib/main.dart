import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ticket/bloc/blocs.dart';
import 'package:flutter_ticket/bloc/movie_bloc.dart';
import 'package:flutter_ticket/services/services.dart';
import 'package:flutter_ticket/ui/pages/pages.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthServices.userStream,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => PageBloc()),
          BlocProvider(create: (_) => UserBloc()),
          BlocProvider(create: (_) => MovieBloc()..add(FetchMovies()))
        ],
        child: MaterialApp(debugShowCheckedModeBanner: false, home: Wrapper())),
    );
  }
}
