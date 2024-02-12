

import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/models/response/newsapi.dart';
import 'package:starter/app/data/network/news_api.dart';
import 'package:starter/base/base_repository.dart';
import 'package:starter/utils/helper/exception_handler.dart';

import '../models/response/user_response.dart';

class NewsAppRepository extends BaseRepository{

  Future<RepoResponse<NewsApiResponse>> fetchNewsAPI(String url)  async{

    final response = await controller.get(path: url);
    return response is APIException ?
     RepoResponse(error: response)
        : RepoResponse(data: NewsApiResponse.fromJson(response));
  }
}
