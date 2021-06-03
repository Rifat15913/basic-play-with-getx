import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:football_trivia/constants.dart';
import 'package:football_trivia/util/helper/network/api.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class RemoteRepository {
  RemoteRepository._internal();

  static final RemoteRepository _instance = RemoteRepository._internal();

  static RemoteRepository on() {
    if (ApiUtil.client == null) {
      ApiUtil.client = Dio(
        BaseOptions(
          baseUrl: baseApiUrl,
          headers: {
            HttpHeaders.acceptHeader: responseOfJsonType,
          },
        ),
      );

      ApiUtil.client!.interceptors.add(
        PrettyDioLogger(
          requestHeader: kDebugMode,
          requestBody: kDebugMode,
          responseBody: kDebugMode,
          responseHeader: kDebugMode,
        ),
      );
    }

    return _instance;
  }

  // Authentication
/*  Future<LoginResponse> login(
    String emailAddress,
    String password,
  ) async {
    final response = await ApiUtil.postRequest(
      endPoint: loginUrl,
      data: {
        keyEmail: emailAddress,
        keyPassword: password,
      },
    );

    return LoginResponse.fromJson(response.data);
  }*/

  /*Future<GetSurveyDataResponse> getSurveyData() async {
    final response = await ApiUtil.getRequest(
      endPoint: surveyUrl,
      shouldGetOtherHeaders: true,
    );

    return GetSurveyDataResponse.fromJson(response.data);
  }

  Future<BaseResponse> submitSurveyData({
    required List<int> categoryList,
    required String timeLength,
    required String profession,
  }) async {
    final response = await ApiUtil.postRequest(
      endPoint: surveyUrl,
      shouldGetOtherHeaders: true,
      data: {
        keyTrainingCategory: categoryList,
        keyTimeLength: timeLength,
        keyProfession: profession,
      },
    );

    return BaseResponse(response.data);
  }*/
}
