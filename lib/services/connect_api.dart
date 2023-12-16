import 'package:get/get.dart';

import '../main.dart';



class ApiServices extends GetConnect {
  GetHttpClient getHttpClient = GetHttpClient(
    timeout: const Duration(seconds: 30),
  );

  Future<Response> getData({required String url}) async {
    var response =
    await getHttpClient.get('http://94.231.192.184:30080/api/$url',headers: {
      'Authorization': 'Bearer $token',

      "Accept":"application/json",
      "Content-Type":"application/json",

    });
    if (response.hasError) {
      return Future.error(response.hasError);
    } else {
      return response;
    }
  }

  Future<Response> postData({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    // إرسال طلب GET واستلام الرد
    final response = await httpClient.post(
      'http://94.231.192.184:30080/api/$url',headers: {
      'Authorization': 'Bearer $token',
      "Accept":"application/json",
      "Content-Type":"application/json",
    },

      body: body,
    );
    if (response.hasError) {
      return Future.error(response.hasError);
    } else {
      return response;
    }
  }
}