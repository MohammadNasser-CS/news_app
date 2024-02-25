import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/top_headlines_api_response.dart';
import 'package:news_app/utils/app_constants.dart';

abstract class HomeServices {
  Future<TopHeadlinesApiResponse> getUsTopHeadlines();
}

class HomeServicesImpl implements HomeServices {
  final dio = Dio();

  @override
  Future<TopHeadlinesApiResponse> getUsTopHeadlines() async {
    dio.options.baseUrl = AppConstants.baseUrl;
    debugPrint('request base url: ${dio.options.baseUrl}');
    Response<Map<String, dynamic>> response = await dio.get(
      AppConstants.topHeadlines,
      options: Options(
        headers: {
          'Authorization': 'Bearer 483cfdf815b34dd48e59c99e7767167f',
        },
      ),
      queryParameters: {
        'country': 'us',
      },
    );
    debugPrint('response: ${response.data}');
    return TopHeadlinesApiResponse.fromJson(response.data!);
  }
}
// if (response.statusCode != 200) {
    //   throw Exception('Failed to load top headlines');
    // }


 // queryParameters: {
      //   'country': 'us',
      // },