import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> streamProducts() async* {
    yield* firestore.collection("products").snapshots();
  }
}
