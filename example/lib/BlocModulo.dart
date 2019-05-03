
import 'package:simple_injector/simple_injector.dart';
import 'package:simple_injector_demo/bloc/Bloc1.dart';
import 'package:simple_injector_demo/bloc/Bloc2.dart';

class BlocModulo extends ModuleInjector{

  BlocModulo(){
    add(Bloc1, bloc1Create);
    add(Bloc2, bloc2Create);
  }

  Bloc1 bloc1Create(){
    return Bloc1(
      SimpleInjector().inject()
    );
  }

  Bloc2 bloc2Create(){
    return Bloc2(
        SimpleInjector().inject()
    );
  }
}