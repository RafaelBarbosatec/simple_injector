
import 'package:simple_injector/simple_injector.dart';

abstract class ModuleInjector{

  get flavor => SimpleInjector().getFlavor();

  Map<Type,Function> _mapInjector = Map();
  void add(Type type, Function create){
    _mapInjector[type] = create;
  }

  Map<Type,Function> getMapInjector(){
    return _mapInjector;
  }
}