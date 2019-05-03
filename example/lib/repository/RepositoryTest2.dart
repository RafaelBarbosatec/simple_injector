import 'package:simple_injector_demo/repository/RepositoryTest.dart';

abstract class RepositoryTest2{
  String getTest2();
}

class RepositoryTest2Impl implements RepositoryTest2{

  final RepositoryTest r;

  RepositoryTest2Impl(this.r);

  @override
  String getTest2() {
    return "Call RepositoryTest2!!!\n${r.getTest()}";
  }

}