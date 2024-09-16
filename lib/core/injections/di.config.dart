// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:mvvm_project/core/api/api.dart' as _i71;
import 'package:mvvm_project/core/data/data_sources/interfaces/i_sample_data_source.dart'
    as _i684;
import 'package:mvvm_project/core/data/data_sources/sample_data_source.dart'
    as _i639;
import 'package:mvvm_project/core/data/repos/sample_repo_impl.dart' as _i472;
import 'package:mvvm_project/core/domain/repositories/sample_repository.dart'
    as _i965;
import 'package:mvvm_project/core/http_client/http_client.dart' as _i447;
import 'package:mvvm_project/core/http_client/i_http_client.dart' as _i1037;
import 'package:mvvm_project/core/presentation/view_models/sample_view_model.dart'
    as _i424;
import 'package:mvvm_project/features/home/presentation/view_models/home_view_model.dart'
    as _i743;

const String _dev = 'dev';

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
    gh.lazySingleton<_i71.Api>(
      () => _i71.Api(),
      registerFor: {_dev},
    );
    gh.factory<_i1037.IHttpClient>(
      () => _i447.HttpClient(api: gh<_i71.Api>()),
      registerFor: {_dev},
    );
    gh.factory<_i684.ISampleDataSource>(
      () => _i639.SampleDataSource(httpClient: gh<_i1037.IHttpClient>()),
      registerFor: {_dev},
    );
    gh.factory<_i965.ISampleRepository>(
      () => _i472.SampleRepoImpl(gh<_i684.ISampleDataSource>()),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i424.SampleViewModel>(
      () => _i424.SampleViewModel(sampleRepo: gh<_i965.ISampleRepository>()),
      registerFor: {_dev},
    );
    gh.lazySingleton<_i743.HomeViewModel>(
      () => _i743.HomeViewModel(gh<_i424.SampleViewModel>()),
      registerFor: {_dev},
    );
    return this;
  }
}
