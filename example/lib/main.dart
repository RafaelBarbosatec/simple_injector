import 'package:flutter/material.dart';
import 'package:simple_injector/simple_injector.dart';
import 'package:simple_injector_demo/BlocModulo.dart';
import 'package:simple_injector_demo/bloc/Bloc1.dart';
import 'package:simple_injector_demo/bloc/Bloc2.dart';
import 'package:simple_injector_demo/repository/RepositoryTest2.dart';

import 'RepositoryModulo.dart';
import 'package:simple_injector_demo/repository/RepositoryTest.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  MyApp(){
    SimpleInjector.configure(Flavor.PROD);
    SimpleInjector().registerModule(RepositoryModulo());
    SimpleInjector().registerModule(BlocModulo());
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  RepositoryTest repository = SimpleInjector().inject();
  RepositoryTest2 repository2 = SimpleInjector().inject();

  Bloc1 bloc1 = SimpleInjector().inject();
  Bloc2 bloc2 = SimpleInjector().inject();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(repository.getTest()),
            Text(repository2.getTest2()),
            Container(
              height: 20.0,
            ),
            Text(bloc1.teste()),
            Text(bloc2.teste())
          ],
        ),
      ),
    );
  }

}
