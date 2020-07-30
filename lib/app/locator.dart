import 'package:discoversu/app/locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
// Important. Impore the locator.iconfig.dart file

final locator = GetIt.instance;

@injectableInit
void setupLocator() => $initGetIt(locator);
