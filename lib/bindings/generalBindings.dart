import 'package:get/get.dart';

import '../utils/networkConnection/networkManager.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(NetworkManager());
  }
}
