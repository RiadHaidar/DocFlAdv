import 'package:flutteradvnced/core/networking/api_result.dart';
import 'package:flutteradvnced/core/networking/api_service.dart';
import 'package:flutteradvnced/features/signup/data/models/signup_request_body.dart';
import 'package:flutteradvnced/features/signup/data/models/signup_response.dart';

import '../../../../core/networking/api_error_handler.dart';

class SignUpRepo {
  final ApiService _apiService;

  SignUpRepo(this._apiService);

  Future<ApiResult<SingUpResponse>> signup(
      SignUpRequestBody signUpRequestBody) async {
    try {
      final response = await _apiService.signup(signUpRequestBody);

      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
