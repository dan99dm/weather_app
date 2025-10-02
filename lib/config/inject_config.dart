import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'inject_config.config.dart';

///Configuration file to get started with injectable and get it

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
void configureDependencies() => getIt.init();
