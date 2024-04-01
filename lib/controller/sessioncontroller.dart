import 'package:addfunction/model/productlistmodel.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as client;

class SessionController extends GetxController {
  client.Response? response;
  bool isLoading = true;
  final client.Dio dio = client.Dio();
  Productlistmodel? productlistmodel;
 List<Datum>? data;
  @override
  void onInit() {
    productselecting();
    super.onInit();
  }
   void incrementQuantity(int index) {

    update();
  }
void decrementQuantity(int index) {
   
  }
  Future productselecting() async {
    try {
      response = await dio.get(
          'https://bycuat.fatneedle.com/api/general_api/get_Particular_Category_Products?cat_id=1');
      if (response!.statusCode == 200) {
        productlistmodel = Productlistmodel.fromJson(response!.data);
        print('checking for response${response!.data}');

      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print(e.toString());
      throw e;
    } finally {
      isLoading = false;
    }
  }
}
