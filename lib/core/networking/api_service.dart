

import 'package:dio/dio.dart';
import 'package:flutteradvnced/core/networking/api_constants.dart';
import 'package:flutteradvnced/features/login/data/models/login_request_body.dart';
import 'package:flutteradvnced/features/login/data/models/login_response.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl:ApiConstants.apiBaseUrl)
abstract class ApiService{


 factory ApiService(Dio dio,{required String baseUrl})=>_ApiService(dio,baseUrl: baseUrl);

 
 @POST(ApiConstants.login)
 Future<LoginResponse> login(
  @Body()LoginRequestBody loginRequestBody
     );
}
