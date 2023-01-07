import 'package:get/get.dart';

import '../controllers/detail_product_controller.dart';

class DetailProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailProductController>(
      () => DetailProductController(),
    );
  }
}
