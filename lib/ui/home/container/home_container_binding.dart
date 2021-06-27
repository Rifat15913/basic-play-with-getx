import 'package:demo_app/ui/home/container/home_container_controller.dart';
import 'package:get/get.dart';

class HomeContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeContainerController>(HomeContainerController());
  }
}
