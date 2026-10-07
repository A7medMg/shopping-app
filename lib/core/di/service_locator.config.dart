// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shoppingapp/core/helper/app_secure_storage.dart' as _i161;
import 'package:shoppingapp/core/network/dio_factory.dart' as _i590;
import 'package:shoppingapp/feature/home/data/repo/home_data_source_imp.dart'
    as _i272;
import 'package:shoppingapp/feature/home/data/repo/home_repo_imp.dart'
    as _i540;
import 'package:shoppingapp/feature/home/domain/repo/home_data_source_interface.dart'
    as _i556;
import 'package:shoppingapp/feature/home/domain/repo/home_repo_interface.dart'
    as _i1062;
import 'package:shoppingapp/feature/home/domain/use_case/get_all_category_use_case.dart'
    as _i606;
import 'package:shoppingapp/feature/home/domain/use_case/get_all_product_use_case.dart'
    as _i301;
import 'package:shoppingapp/feature/home/presentation/view_models/product_cubit.dart'
    as _i805;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.singleton<_i361.Dio>(() => dioModule.provideDio());
    gh.factory<_i556.HomeDataSourceInterface>(
      () => _i272.HomeDataSourceImp(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i161.AppSecureStorage>(
      () => _i161.AppSecureStorage(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i1062.HomeRepoInterface>(
      () => _i540.HomeRepoImp(gh<_i556.HomeDataSourceInterface>()),
    );
    gh.factory<_i606.GetAllCategoryUseCase>(
      () => _i606.GetAllCategoryUseCase(gh<_i1062.HomeRepoInterface>()),
    );
    gh.factory<_i301.GetAllProductUseCase>(
      () => _i301.GetAllProductUseCase(gh<_i1062.HomeRepoInterface>()),
    );
    gh.factory<_i805.ProductCubit>(
      () => _i805.ProductCubit(gh<_i301.GetAllProductUseCase>()),
    );
    return this;
  }
}

class _$DioModule extends _i590.DioModule {}
