import 'dart:io';

import 'package:news_app/config/app_config.dart';
import 'package:news_app/data/models/response_server.dart';
import 'package:news_app/data/models/source_model.dart';
import 'package:news_app/framework/api_helper.dart';

import '../../utils/constant.dart';

abstract class NewsRemoteDataSource {
  Future<ResponseServer> getSourcebyCategory(String category);

  Future<ResponseServer> getArticlesbySource(String source);
}

class NewsRemoteDataSourceImpl extends NewsRemoteDataSource {
  final ApiHelper _apiHelper;

  NewsRemoteDataSourceImpl(this._apiHelper);

  @override
  Future<ResponseServer> getSourcebyCategory(String category) async {
    var query = {'category': category};
    var result = await _apiHelper.request('GET', 'sources',
        queryParams: query, contentType: 'application/json');
    return result;
  }

  @override
  Future<ResponseServer> getArticlesbySource(String source) async {
    var query = {'sources': source};
    var result = await _apiHelper.request(get, 'everything',
        contentType: 'application/json', queryParams: query);
    return result;
  }
}
