# simple_injector

Simple Injector DI

# Usage
To use this plugin, add `simple_injector` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/).

### Example
Before configure is necessary create module of the inject. Example:

``` dart

import 'package:simple_injector/module_injector.dart';
import 'package:simple_injector/simple_injector.dart';

class RepositoryModulo extends ModuleInjector{

  ///in the constructor we add what should be injected by passing: type and the method that creates it (optional isSingleton if desired)
  RepositoryModulo(){
    add(RepositoryTest, repositoryTest, isSingleton: true);
    add(RepositoryTest2, repositoryTest2);
  }

  RepositoryTest repositoryTest(){
      return RepositoryTestImpl();
  }

  RepositoryTest2 repositoryTest2(){
    return RepositoryTest2Impl(
      SimpleInjector().inject()
    );
  }

}
```

After the module created we configured our SimpleInjector in the constructor app

``` dart
import 'package:simple_injector/simple_injector.dart';

MyApp(){
    SimpleInjector.configure(Flavor.PROD);
    SimpleInjector().registerModule(RepositoryModulo());
  }
```

All ready! you can register as many modules as you want. to inject air into a configured dependency, just add this:

``` dart

RepositoryTest repository = SimpleInjector().inject();

or

final repository = SimpleInjector().<RepositoryTest>inject();

```
