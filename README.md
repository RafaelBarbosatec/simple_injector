[![pub package](https://img.shields.io/pub/v/simple_injector.svg)](https://pub.dartlang.org/packages/simple_injector)

# SimpleInjector(discontinued)

Use [injector](https://pub.dev/packages/injector) is similar and more complete

Inject your dependencies simply and quickly. The dependency is created in the measure that it is injected, if it is configured singleton it is created only in the first one that is injected.

ATTENTION: This package has no connection with the company or libraries of https://simpleinjector.org

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
      inject()
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
