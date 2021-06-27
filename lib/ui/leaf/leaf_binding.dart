import 'package:demo_app/ui/leaf/leaf_controller.dart';
import 'package:get/get.dart';

class LeafBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LeafController>(() => LeafController());
  }
}
