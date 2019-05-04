import 'package:simple_injector/module_injector.dart';
import 'package:simple_injector/simple_injector.dart';
import 'main.dart';

class RepositoryModulo extends ModuleInjector {
  RepositoryModulo() {
    add(RepositoryTest, repositoryTest, isSingleton: true);
    add(RepositoryTest2, repositoryTest2);
  }

  RepositoryTest repositoryTest() {
    return RepositoryTestImpl();
  }

  RepositoryTest2 repositoryTest2() {
    return RepositoryTest2Impl(inject());
  }
}
