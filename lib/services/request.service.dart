import 'package:activity_tracker/config/constants.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class RequestService extends GetxService {
  static RequestService get instance => Get.find<RequestService>();

  late Dio _client;

  Dio get client => _client;

  @override
  void onInit() {
    super.onInit();
    final options = BaseOptions(baseUrl: Constants.baseUrl);
    _client = Dio(options);
  }
}
