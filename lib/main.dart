import 'package:flutter/material.dart';
import 'package:todo/pages/add_todo.dart';
import 'package:todo/pages/login.dart';
import 'package:todo/pages/todo_list.dart';
import 'package:todo/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routes: {
        "/login": (context) => LoginPage(),
        "/todos": (context) => TodoPage(),
        "/add-todo": (context) => AddTodo()
      },
      initialRoute: "/login",
    );
  }
}