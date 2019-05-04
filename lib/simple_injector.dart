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
  static bool _showDebug;
  Map<Type,Injection> _injectorMap = Map();

  static void configure(Flavor flavor,{bool showDebug = false}) {
    _flavor = flavor;
    _showDebug = showDebug;
  }

  factory SimpleInjector() {
    return _singleton;
  }

  SimpleInjector._internal();

  Flavor getFlavor() => _flavor;

  T inject<T>(){

    if(_injectorMap.containsKey(T)){
      if(_injectorMap[T].isSingleton){
        if(_injectorMap[T].instance == null){
          _injectorMap[T].instance = _injectorMap[T].create();
          showDebugCreateSingleton(T);
        }
        showDebugInjectorSingletonInstance(T);
        return _injectorMap[T].instance;
      }
      showDebugInjectorNewInstance(T);
      return _injectorMap[T].create();

    }else{
      print("${this.runtimeType}:: Error: Not found $T in modules for inject");
      return null;
    }
  }

  void registerModule(ModuleInjector moduleInjector) {
    _injectorMap.addAll(moduleInjector.getMapInjector());
  }

  void showDebugInjectorNewInstance(Type t) {
    if(_showDebug){
      print("${this.runtimeType}:: Inject new $t");
    }
  }

  void showDebugInjectorSingletonInstance(Type t) {
    if(_showDebug){
      print("${this.runtimeType}:: Inject singleton $t");
    }
  }

  void showDebugCreateSingleton(Type t) {
    if(_showDebug){
      print("${this.runtimeType}:: Create singleton $t");
    }
  }

}
