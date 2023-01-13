import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DetailProductController extends GetxController {
  RxBool isLoadingUpdate = false.obs;
  RxBool isLoadingDelete = false.obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<Map<String, dynamic>> editProduct(Map<String, dynamic> data) async {
    try {
      await firestore.collection("products").doc(data["id"]).update({
        "name": data["name"],
        "qty": data["qty"],
      });

      return {
        "error": false,
        "message": "Berhasil update product.",
      };
    } catch (e) {
      return {
        "error": true,
        "message": "Tidak dapat update product.",
      };
    }
  }

  Future<Map<String, dynamic>> deleteProduct(String id) async {
    try {
      await firestore.collection("products").doc(id).delete();
      return {
        "error": false,
        "message": "Berhasil delete product.",
      };
    } catch (e) {
      return {
        "error": true,
        "message": "Tidak dapat delete product.",
      };
    }
  }
}
