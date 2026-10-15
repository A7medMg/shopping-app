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
import 'package:shoppingapp/feature/app_section/presentation/view_model/app_section_cubit.dart'
    as _i525;
import 'package:shoppingapp/feature/home/data/api/home_api.dart' as _i855;
import 'package:shoppingapp/feature/home/data/api/home_api_imp.dart' as _i204;
import 'package:shoppingapp/feature/home/data/repo/home_data_source_imp.dart'
    as _i879;
import 'package:shoppingapp/feature/home/data/repo/home_repo_imp.dart' as _i111;
import 'package:shoppingapp/feature/home/domain/repo/home_data_source_interface.dart'
    as _i1052;
import 'package:shoppingapp/feature/home/domain/repo/home_repo_interface.dart'
    as _i170;
import 'package:shoppingapp/feature/home/domain/use_case/get_all_category_use_case.dart'
    as _i1068;
import 'package:shoppingapp/feature/home/domain/use_case/get_all_product_use_case.dart'
    as _i418;
import 'package:shoppingapp/feature/home/domain/use_case/get_products_by_category_id.dart'
    as _i293;
import 'package:shoppingapp/feature/home/presentation/view_models/home_cubit.dart'
    as _i765;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<_i525.AppSectionCubit>(() => _i525.AppSectionCubit());
    gh.singleton<_i361.Dio>(() => dioModule.provideDio());
    gh.factory<_i855.HomeApi>(() => _i204.HomeApiImp(gh<_i361.Dio>()));
    gh.lazySingleton<_i161.AppSecureStorage>(
      () => _i161.AppSecureStorage(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i1052.HomeDataSourceInterface>(
      () => _i879.HomeDataSourceImp(gh<_i855.HomeApi>()),
    );
    gh.factory<_i170.HomeRepoInterface>(
      () => _i111.HomeRepoImp(gh<_i1052.HomeDataSourceInterface>()),
    );
    gh.factory<_i1068.GetAllCategoryUseCase>(
      () => _i1068.GetAllCategoryUseCase(gh<_i170.HomeRepoInterface>()),
    );
    gh.factory<_i418.GetAllProductUseCase>(
      () => _i418.GetAllProductUseCase(gh<_i170.HomeRepoInterface>()),
    );
    gh.factory<_i293.GetAllProductByCategoryUseCase>(
      () => _i293.GetAllProductByCategoryUseCase(gh<_i170.HomeRepoInterface>()),
    );
    gh.factory<_i765.HomeCubit>(
      () => _i765.HomeCubit(
        gh<_i418.GetAllProductUseCase>(),
        gh<_i293.GetAllProductByCategoryUseCase>(),
        gh<_i1068.GetAllCategoryUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i590.DioModule {}
