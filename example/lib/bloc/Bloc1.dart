

import 'package:simple_injector_demo/repository/RepositoryTest.dart';

class Bloc1{

  final RepositoryTest repo;

  Bloc1(this.repo);

  String teste(){
    return "BLOC1: ${repo.getTest()}";
  }
}