import 'package:demo_app/ui/cart/view/cart_controller.dart';
import 'package:demo_app/ui/home/container/home_container_controller.dart';
import 'package:demo_app/ui/home/content/home_content_controller.dart';
import 'package:get/get.dart';

class HomeContainerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeContainerController>(HomeContainerController());
    Get.put<HomeContentController>(HomeContentController());
    Get.lazyPut<CartPageController>(() => CartPageController());
  }
}
