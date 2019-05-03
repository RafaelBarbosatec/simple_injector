library simple_injector;

import 'package:simple_injector/module_injector.dart';
export 'package:simple_injector/module_injector.dart';

enum Flavor {
  DEBUG,
  HOMOLOG,
  PROD
}

class SimpleInjector {
  static final SimpleInjector _singleton = new SimpleInjector._internal();
  static Flavor _flavor;
  Map<Type,Function> _injectorMap = Map();

  static void configure(Flavor flavor) {
    _flavor = flavor;
  }

  factory SimpleInjector() {
    return _singleton;
  }

  SimpleInjector._internal();

  Flavor getFlavor() => _flavor;

  T inject<T>(){
    if(_injectorMap.containsKey(T)){
      print("Inject $T");
      return _injectorMap[T]();
    }else{
      print("Error: Not found $T in modules for inject");
      return null;
    }
  }

  void registerModule(ModuleInjector moduleInjector) {
    _injectorMap.addAll(moduleInjector.getMapInjector());
  }

}
