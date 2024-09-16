import 'package:mvvm_project/core/domain/repositories/sample_repository.dart';
import 'package:mvvm_project/core/injections/di.dart';
import 'package:mvvm_project/core/presentation/view_models/sample_view_model.dart';
import 'package:mvvm_project/features/home/presentation/view_models/home_view_model.dart';
import 'package:provider/provider.dart';

class AppProviders {
  static get allProviders => [
        ChangeNotifierProvider(
          create: (_) => HomeViewModel(locator<SampleViewModel>()),
        ),
        ChangeNotifierProvider(
          create: (_) =>
              SampleViewModel(sampleRepo: locator<ISampleRepository>()),
        ),
      ];
}
