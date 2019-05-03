

import 'package:simple_injector/module_injector.dart';
import 'package:simple_injector/simple_injector.dart';
import 'package:simple_injector_demo/repository/RepositoryTest2.dart';

import 'package:simple_injector_demo/repository/RepositoryTest.dart';

class RepositoryModulo extends ModuleInjector{

  RepositoryTest repositoryTestSingleton;

  RepositoryModulo(){
    add(RepositoryTest, repositoryTest);
    add(RepositoryTest2, repositoryTest2);
  }

  RepositoryTest repositoryTest(){
    if(repositoryTestSingleton == null){
      repositoryTestSingleton = RepositoryTestImpl();
    }
    return repositoryTestSingleton;
  }

  RepositoryTest2 repositoryTest2(){
    return RepositoryTest2Impl(
      SimpleInjector().inject()
    );
  }

}