import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_product_controller.dart';

class DetailProductView extends GetView<DetailProductController> {
  const DetailProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailProductView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'DetailProductView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
