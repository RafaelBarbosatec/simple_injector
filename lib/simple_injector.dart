library simple_injector;

import 'package:simple_injector/injection.dart';
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
  Map<Type,Injection> _injectorMap = Map();

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

      if(_injectorMap[T].isSingleton){
        if(_injectorMap[T].instance == null){
          _injectorMap[T].instance = _injectorMap[T].create();
          print("Create singleton $T");
        }
        return _injectorMap[T].instance;
      }

      return _injectorMap[T].create();

    }else{
      print("Error: Not found $T in modules for inject");
      return null;
    }
  }

  void registerModule(ModuleInjector moduleInjector) {
    _injectorMap.addAll(moduleInjector.getMapInjector());
  }

}
