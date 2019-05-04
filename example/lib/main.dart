import 'package:flutter/material.dart';
import 'package:simple_injector/simple_injector.dart';
import 'package:simple_injector_demo/bloc_modulo.dart';
import 'package:simple_injector_demo/repository_modulo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp() {
    SimpleInjector.configure(Flavor.PROD, showDebug: true);
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

///RepositoryTest
abstract class RepositoryTest {
  String getTest();
}

class RepositoryTestImpl implements RepositoryTest {
  @override
  String getTest() {
    return "Call RepositoryTest!!!";
  }
}

///RepositoryTest2
abstract class RepositoryTest2 {
  String getTest2();
}

class RepositoryTest2Impl implements RepositoryTest2 {
  final RepositoryTest r;

  RepositoryTest2Impl(this.r);

  @override
  String getTest2() {
    return "Call RepositoryTest2!!!\n${r.getTest()}";
  }
}

///Bloc1
class Bloc1 {
  final RepositoryTest repo;

  Bloc1(this.repo);

  String teste() {
    return "BLOC1: ${repo.getTest()}";
  }
}

///Bloc2
class Bloc2 {
  final RepositoryTest2 repo;

  Bloc2(this.repo);

  String teste() {
    return "BLOC2: ${repo.getTest2()}";
  }
}
