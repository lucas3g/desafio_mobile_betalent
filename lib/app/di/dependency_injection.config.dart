// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../core/data/clients/http/client_http.dart' as _i238;
import '../core/data/clients/http/dio_http_client_impl.dart' as _i155;
import '../modules/employees/data/datasources/employee_datasource.dart'
    as _i252;
import '../modules/employees/data/datasources/employee_datasource_imp.dart'
    as _i247;
import '../modules/employees/data/repositories/employee_repository_imp.dart'
    as _i1023;
import '../modules/employees/domain/repositories/employee_repository.dart'
    as _i773;
import '../modules/employees/domain/usecases/get_employees.dart' as _i105;
import '../modules/employees/presenter/controller/bloc/employee_bloc.dart'
    as _i213;
import 'dependency_injection.dart' as _i9;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    gh.factory<_i361.Dio>(() => registerModule.dio);
    gh.singleton<_i238.ClientHttp>(
        () => _i155.DioClientHttpImpl(dio: gh<_i361.Dio>()));
    gh.factory<_i252.EmployeeDatasource>(
        () => _i247.EmployeeDatasourceImp(clientHttp: gh<_i238.ClientHttp>()));
    gh.factory<_i773.EmployeeRepository>(() => _i1023.EmployeeRepositoryImp(
        employeeDatasource: gh<_i252.EmployeeDatasource>()));
    gh.factory<_i105.GetEmployees>(
        () => _i105.GetEmployees(repository: gh<_i773.EmployeeRepository>()));
    gh.factory<_i213.EmployeeBloc>(
        () => _i213.EmployeeBloc(getEmployees: gh<_i105.GetEmployees>()));
    return this;
  }
}

class _$RegisterModule extends _i9.RegisterModule {}
