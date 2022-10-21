import 'package:get_it/get_it.dart';
import 'package:nano_news/utility/shared_utility.dart';
import 'dart:async';

GetIt dependencyAssembler = GetIt.instance;

void setUpdependencyAssembly() async {
  await dependencyAssembler.reset();
  dependencyAssembler.registerSingleton<SharedUtility>(SharedUtility());
}
