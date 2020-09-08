import 'package:dio/dio.dart';
import '../models/repository.dart';

const String endPoint = 'https://api.github.com';

class GitHubService {
  final Dio dio = Dio();

  Future<Repository> getRepositoryGitHub(
      {String value = 'facebook/react'}) async {
    try {
      final Response response = await dio.get('$endPoint${'/repos/$value'}');
      return Repository.fromMap(response.data);
    } catch (err) {
      rethrow;
    }
  }
}
