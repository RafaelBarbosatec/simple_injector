class Injection {
  final Function create;
  final bool isSingleton;
  dynamic instance;

  Injection(this.create, this.isSingleton);
}
