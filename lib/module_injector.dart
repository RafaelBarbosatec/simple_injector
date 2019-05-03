
import 'package:simple_injector/injection.dart';
import 'package:simple_injector/simple_injector.dart';

abstract class ModuleInjector{

  Flavor get flavor => SimpleInjector().getFlavor();

  Map<Type,Injection> _mapInjector = Map();
  void add(Type type, Function create,{bool isSingleton = false}){
    _mapInjector[type] = Injection(create,isSingleton);
  }

  Map<Type,Injection> getMapInjector(){
    return _mapInjector;
  }
}