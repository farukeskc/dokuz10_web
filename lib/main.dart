import 'package:dokuz10_web/models/user.dart';
import 'package:dokuz10_web/provider/theme_provider.dart';
import 'package:dokuz10_web/screens/wrapper.dart';
import 'package:dokuz10_web/services/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Future<FirebaseApp> _initialization = Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyCfd3XP7gOgTfGijt374CZxcNLIWKC9wM8",
        authDomain: "dokuz10-ebd02.firebaseapp.com",
        projectId: "dokuz10-ebd02",
        storageBucket: "dokuz10-ebd02.appspot.com",
        messagingSenderId: "153181709333",
        appId: "1:153181709333:web:f8d723a088633e96b09a1c",
        measurementId: "G-7H3Y0CCQBE"),
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const MaterialApp(
              home: Center(
            child: Text("Couldn't connected db"),
          ));
        } else if (snapshot.connectionState == ConnectionState.done) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => ThemeProvider(),
              ),
              StreamProvider<UserModel?>.value(
                value: AuthServices().authStateChanges,
                initialData: null,
                catchError: (e, _) => null,
              ),
            ],
            builder: (context, _) {
              final themeProvider = Provider.of<ThemeProvider>(context);
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'dokuz10',
                themeMode: themeProvider.themeMode,
                theme:
                    MyThemes.lightTheme,
                darkTheme:
                    MyThemes.darkTheme,
                home: const Wrapper(),
              );
            },
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
