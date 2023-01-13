import 'package:ppdm_fatecrp/services/camera_service.dart';

import 'package:get_it/get_it.dart';
import 'package:ppdm_fatecrp/services/face_detector_service.dart';

final locator = GetIt.instance;

void setupServices() {
  locator.registerLazySingleton<CameraService>(() => CameraService());
  locator.registerLazySingleton<FaceDetectorService>(() => FaceDetectorService());

}
