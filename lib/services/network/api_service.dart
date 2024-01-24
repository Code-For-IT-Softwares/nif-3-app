// import 'package:json_annotation/json_annotation.dart';
// import 'package:retrofit/retrofit.dart';
// import 'package:dio/dio.dart';

// part 'api_service.g.dart';

// @RestApi(baseUrl: "http://localhost:7070/api")
// abstract class ApiService {
//   factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

//   @GET("/posts")
//   Future<List<Post>> getPosts();
// }
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "http://nif.opju.ac.in:7070/api")
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

  @POST("/user/auth")
  Future<String> userAuthApi(
    @Body()
    String requestBody
    );

    
  @POST("/user")
  Future<String> newUserApi(
    @Body()
    String requestBody
    );
}