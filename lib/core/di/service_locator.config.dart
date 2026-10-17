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
import 'package:shoppingapp/core/di/register_module.dart' as _i999;
import 'package:shoppingapp/core/helper/app_secure_storage.dart' as _i161;
import 'package:shoppingapp/core/network/dio_factory.dart' as _i590;
import 'package:shoppingapp/feature/account/data/api/account_api_imp.dart'
    as _i910;
import 'package:shoppingapp/feature/account/data/api/account_api_interface.dart'
    as _i179;
import 'package:shoppingapp/feature/account/data/repo/acc_data_source_imp.dart'
    as _i793;
import 'package:shoppingapp/feature/account/data/repo/acc_repo_imp.dart'
    as _i802;
import 'package:shoppingapp/feature/account/domain/repo/acc_data_source_interface.dart'
    as _i18;
import 'package:shoppingapp/feature/account/domain/repo/acc_repo_interface.dart'
    as _i344;
import 'package:shoppingapp/feature/account/domain/use_case/edit_user_use_case.dart'
    as _i451;
import 'package:shoppingapp/feature/account/domain/use_case/get_user_use_case.dart'
    as _i653;
import 'package:shoppingapp/feature/account/domain/use_case/upload_user_image_use_case.dart'
    as _i1002;
import 'package:shoppingapp/feature/account/presentation/view_model/account_cubit.dart'
    as _i846;
import 'package:shoppingapp/feature/app_section/presentation/view_model/app_section_cubit.dart'
    as _i525;
import 'package:shoppingapp/feature/auth/data/api/auth_api.dart' as _i425;
import 'package:shoppingapp/feature/auth/data/repo/auth_data_source_imp.dart'
    as _i520;
import 'package:shoppingapp/feature/auth/data/repo/auth_repo_imp.dart' as _i167;
import 'package:shoppingapp/feature/auth/domain/repo/auth_data_source_interface.dart'
    as _i627;
import 'package:shoppingapp/feature/auth/domain/repo/auth_repo_interface.dart'
    as _i32;
import 'package:shoppingapp/feature/auth/domain/use_case/login_use_case.dart'
    as _i515;
import 'package:shoppingapp/feature/auth/domain/use_case/register_use_case.dart'
    as _i700;
import 'package:shoppingapp/feature/auth/presentation/view_model/login/login_cubit.dart'
    as _i437;
import 'package:shoppingapp/feature/auth/presentation/view_model/register/register_cubit.dart'
    as _i879;
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
import 'package:shoppingapp/feature/product_details/api/product_details_api_imp.dart'
    as _i318;
import 'package:shoppingapp/feature/product_details/data/api/product_details_api.dart'
    as _i165;
import 'package:shoppingapp/feature/product_details/data/repo/product_details_data_source_imp.dart'
    as _i187;
import 'package:shoppingapp/feature/product_details/data/repo/product_details_repo_imp.dart'
    as _i391;
import 'package:shoppingapp/feature/product_details/domain/repo/product_details_data_source_interface.dart'
    as _i710;
import 'package:shoppingapp/feature/product_details/domain/repo/product_details_repo_interface.dart'
    as _i878;
import 'package:shoppingapp/feature/product_details/domain/use_case/get_product_details_use_case.dart'
    as _i257;
import 'package:shoppingapp/feature/search/data/api/search_api.dart' as _i912;
import 'package:shoppingapp/feature/search/data/api/search_api_imp.dart'
    as _i873;
import 'package:shoppingapp/feature/search/data/repo/search_data_source_imp.dart'
    as _i32;
import 'package:shoppingapp/feature/search/data/repo/search_repo_imp.dart'
    as _i127;
import 'package:shoppingapp/feature/search/domain/repo/search_data_source_interface.dart'
    as _i486;
import 'package:shoppingapp/feature/search/domain/repo/search_repo_interface.dart'
    as _i883;
import 'package:shoppingapp/feature/search/domain/use_case/search_products_use_case.dart'
    as _i898;
import 'package:shoppingapp/feature/search/presentation/view_model/search_cubit.dart'
    as _i240;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    gh.factory<_i558.FlutterSecureStorage>(() => registerModule.secureStorage);
    gh.factory<_i525.AppSectionCubit>(() => _i525.AppSectionCubit());
    gh.singleton<_i590.DioFactory>(() => _i590.DioFactory());
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.factory<_i179.AccountApiInterface>(
      () => _i910.AccountApiImp(gh<_i361.Dio>()),
    );
    gh.factory<_i165.ProductDetailsApi>(
      () => _i318.ProductDetailsApiImpl(gh<_i361.Dio>()),
    );
    gh.factory<_i18.AccDataSourceInterface>(
      () => _i793.AccDataSourceImp(
        gh<_i361.Dio>(),
        gh<_i179.AccountApiInterface>(),
      ),
    );
    gh.factory<_i912.SearchApi>(() => _i873.SearchApiImp(gh<_i361.Dio>()));
    gh.factory<_i486.SearchDataSourceInterface>(
      () => _i32.SearchDataSourceImp(gh<_i912.SearchApi>()),
    );
    gh.factory<_i883.SearchRepoInterface>(
      () => _i127.SearchRepoImp(gh<_i486.SearchDataSourceInterface>()),
    );
    gh.factory<_i855.HomeApi>(() => _i204.HomeApiImp(gh<_i361.Dio>()));
    gh.factory<_i898.SearchProductsUseCase>(
      () => _i898.SearchProductsUseCase(gh<_i883.SearchRepoInterface>()),
    );
    gh.lazySingleton<_i161.AppSecureStorage>(
      () => _i161.AppSecureStorage(gh<_i558.FlutterSecureStorage>()),
    );
    gh.factory<_i1052.HomeDataSourceInterface>(
      () => _i879.HomeDataSourceImp(gh<_i855.HomeApi>()),
    );
    gh.factory<_i170.HomeRepoInterface>(
      () => _i111.HomeRepoImp(gh<_i1052.HomeDataSourceInterface>()),
    );
    gh.factory<_i710.ProductDetailsDataSourceInterface>(
      () => _i187.ProductDetailsDataSourceImp(gh<_i165.ProductDetailsApi>()),
    );
    gh.factory<_i240.SearchCubit>(
      () => _i240.SearchCubit(gh<_i898.SearchProductsUseCase>()),
    );
    gh.lazySingleton<_i425.AuthApi>(
      () => _i425.AuthApi(gh<_i590.DioFactory>(), gh<_i161.AppSecureStorage>()),
    );
    gh.factory<_i344.AccRepoInterface>(
      () => _i802.AccRepoImp(gh<_i18.AccDataSourceInterface>()),
    );
    gh.factory<_i627.AuthDataSourceInterface>(
      () => _i520.AuthDataSourceImp(gh<_i425.AuthApi>()),
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
    gh.factory<_i878.ProductDetailsRepoInterface>(
      () => _i391.ProductDetailsRepoImp(
        gh<_i710.ProductDetailsDataSourceInterface>(),
      ),
    );
    gh.factory<_i32.AuthRepoInterface>(
      () => _i167.AuthRepoImp(
        gh<_i627.AuthDataSourceInterface>(),
        gh<_i161.AppSecureStorage>(),
      ),
    );
    gh.factory<_i515.LoginUseCase>(
      () => _i515.LoginUseCase(gh<_i32.AuthRepoInterface>()),
    );
    gh.factory<_i700.RegisterUseCase>(
      () => _i700.RegisterUseCase(gh<_i32.AuthRepoInterface>()),
    );
    gh.factory<_i765.HomeCubit>(
      () => _i765.HomeCubit(
        gh<_i418.GetAllProductUseCase>(),
        gh<_i293.GetAllProductByCategoryUseCase>(),
        gh<_i1068.GetAllCategoryUseCase>(),
      ),
    );
    gh.factory<_i451.EditUserUseCase>(
      () => _i451.EditUserUseCase(gh<_i344.AccRepoInterface>()),
    );
    gh.factory<_i653.GetUserUseCase>(
      () => _i653.GetUserUseCase(gh<_i344.AccRepoInterface>()),
    );
    gh.factory<_i1002.UploadImageUseCase>(
      () => _i1002.UploadImageUseCase(gh<_i344.AccRepoInterface>()),
    );
    gh.factory<_i437.LoginCubit>(
      () => _i437.LoginCubit(gh<_i515.LoginUseCase>()),
    );
    gh.factory<_i257.GetProductDetailsUseCase>(
      () => _i257.GetProductDetailsUseCase(
        gh<_i878.ProductDetailsRepoInterface>(),
      ),
    );
    gh.factory<_i846.AccountCubit>(
      () => _i846.AccountCubit(
        gh<_i653.GetUserUseCase>(),
        gh<_i1002.UploadImageUseCase>(),
        gh<_i451.EditUserUseCase>(),
      ),
    );
    gh.factory<_i879.RegisterCubit>(
      () => _i879.RegisterCubit(gh<_i700.RegisterUseCase>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i999.RegisterModule {}
