import 'package:dio/dio.dart';

class DioController {

  Dio dio = new Dio();
  Future<Response> getAPI(String url) async {
    print('İstek Atıldı : $url');
    final stopwatch = Stopwatch()..start();
    final response = await dio.get(url);
    stopwatch.stop();
    print('İstek Geldi : ${response}');
    print('Sunucu yanıt süresi: ${stopwatch.elapsedMilliseconds} ms');
    return response;
  }
}