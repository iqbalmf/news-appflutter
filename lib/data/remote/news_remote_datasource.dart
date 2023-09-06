import 'dart:io';

import 'package:news_app/config/app_config.dart';
import 'package:news_app/data/models/source_model.dart';
import 'package:news_app/framework/api_helper.dart';

abstract class NewsRemoteDataSource {
  Future<List<SourceModel>> getSourcebyCategory(String category);
}

class NewsRemoteDataSourceImpl extends NewsRemoteDataSource {
  final ApiHelper _apiHelper;

  NewsRemoteDataSourceImpl(this._apiHelper);

  @override
  Future<List<SourceModel>> getSourcebyCategory(String category) async {
    var query = {
      'category': category,
    };
    var result = await _apiHelper.request(
        'POST', 'top-headlines/sources', queryParams: query, contentType: 'application/json');
    return List.from(result.data['sources']);
  }
}