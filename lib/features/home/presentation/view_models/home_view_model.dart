import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:mvvm_project/core/presentation/view_models/sample_view_model.dart';

@dev
@LazySingleton()
class HomeViewModel extends ChangeNotifier {
  final SampleViewModel sampleViewModel;
  HomeViewModel(this.sampleViewModel);
}
