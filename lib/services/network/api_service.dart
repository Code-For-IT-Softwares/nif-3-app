import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "http://10.60.42.160:7070/api")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  static ApiService getServices() {
    final dio = Dio();

    return ApiService(dio);
  }

  @GET("/stats")
  Future<String> getStatsApi();
  
  @GET("/idea")
  Future<String> getIdeaApi();
  
  @GET("/prototype")
  Future<String> getPrototypeApi();
  
  @GET("/startup")
  Future<String> getStartUpApi();
}
