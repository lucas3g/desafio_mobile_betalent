// ignore_for_file: invalid_annotation_target

import 'dart:async';

import 'package:desafio_mobile_betalent/app/di/dependency_injection.config.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import '../core/domain/entities/app_global.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init',
  preferRelativeImports: true,
  asExtension: true,
)
Future<void> configureDependencies() async {
  _initAppGlobal();

  getIt.init();
}

@module
abstract class RegisterModule {
  Dio get dio => _dioFactory();
}

Dio _dioFactory() {
  final BaseOptions baseOptions = BaseOptions(
    baseUrl: const String.fromEnvironment('BASE_URL'),
    headers: <String, dynamic>{'Content-Type': 'application/json'},
  );

  return Dio(baseOptions);
}

void _initAppGlobal() {
  AppGlobal();
}
