import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_app_test01/src/di/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
Future<GetIt> configureDependencies() async => await $initGetIt(getIt);
