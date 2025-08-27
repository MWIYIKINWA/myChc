import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mychc/controllers/auth_controller.dart';
import 'package:mychc/screens/FrontScreen.dart';
import 'package:mychc/screens/Navigater.dart';
import 'package:mychc/screens/loginPage.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);

    return MaterialApp(
      title: 'MyChc App',
      theme: ThemeData(fontFamily: "Poppins"),
      debugShowCheckedModeBanner: false,
      home: authState.when(
        data: (user) {
          if (user != null) {
            return NavigatePage();
          } else {
            return Frontscreen();
          }
        },
        loading: () =>
            Scaffold(body: Center(child: CircularProgressIndicator())),
        error: (error, stack) =>
            Scaffold(body: Center(child: Text('Error: $error'))),
      ),
      routes: {
        '/nav': (context) => NavigatePage(),
        '/login': (context) => Loginpage(),
      },
    );
  }
}
