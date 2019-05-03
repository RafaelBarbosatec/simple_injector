
import 'package:simple_injector_demo/repository/RepositoryTest2.dart';

class Bloc2{
  final RepositoryTest2 repo;

  Bloc2(this.repo);

  String teste(){
    return "BLOC2: ${repo.getTest2()}";
  }
}