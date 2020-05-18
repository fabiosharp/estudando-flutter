import 'package:firebase/routes/app_routes.dart';
import 'package:firebase/views/user_form.dart';
import 'package:flutter/material.dart';
import 'views/user_list.dart';
import 'provider/users.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: UserList(),
        routes: {
          AppRoutes.HOME : (_) => UserList(),
          AppRoutes.USER_FORM : (_) => UserForm(),
        }
      ),
    );
  }
}
