class BaseConfig {
  static const DEBUG = !bool.fromEnvironment("dart.vm.product");
}
