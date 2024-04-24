import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase_options.dart';

import 'package:todo_app/views/todo_list.dart';
import 'package:todo_app/views/todo_create.dart';
import 'package:todo_app/views/todo_edit.dart';
import 'package:todo_app/views/todo_login.dart';
import 'package:todo_app/data/models/todo_model.dart';
import 'package:todo_app/views/todo_signup.dart';
import 'package:todo_app/views/todo_onboarding.dart';

import 'package:todo_app/viewModels/todo_view_model.dart';
import 'package:todo_app/viewModels/todo_login_view_model.dart';
import 'package:todo_app/viewModels/todo_signup_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoViewModel>(
          create: (context) => TodoViewModel(),
        ),
        ChangeNotifierProvider<TodoLoginViewModel>(
          create: (context) => TodoLoginViewModel(),
        ),
        ChangeNotifierProvider<TodoSignUpViewModel>(
          create: (context) => TodoSignUpViewModel(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const TodoOnboarding(),
        routes: {
          '/create-todo': (context) => const TodoCreate(),
          '/login': (context) => TodoLogin(),
          '/all-todos': (context) => const TodoList(),
          '/signup': (context) => TodoSignUp()
        },
        onGenerateRoute: (settings) {
          if (settings.name == '/edit-todo') {
            final args = settings.arguments as Map<String, dynamic>;
            final task = args['task'] as TodoTaskModel;
            return MaterialPageRoute(
              builder: (context) => TodoEdit(task: task),
            );
          }
          return null;
        },
      ),
    );
  }
}
