import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:food_app/src/scoped-model/food_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'src/scoped-model/main_model.dart';
import 'src/screens/main_screen.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final MainModel mainModel = MainModel();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: mainModel,
      child: MaterialApp(
        title: 'Food App Clone',
        theme: ThemeData(
          primaryColor: Colors.blueAccent,
        ),
        home: MainScreen(model: mainModel),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
