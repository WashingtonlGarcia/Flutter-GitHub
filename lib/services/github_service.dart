import 'package:dio/dio.dart';
import '../models/repository.dart';

const String endPoint = 'https://api.github.com';

class GitHubService {
  final Dio dio = Dio();

  Future<Repository> getRepositoryGitHub(String value, Function onError) async {
    try {
      final Response response = await dio.get('$endPoint${'/repos/$value'}');
      return Repository.fromMap(response.data);
    } on DioError catch (err) {
      onError('Error: ${err.message}');
      throw err.message;
    } catch (err) {
      rethrow;
    }
  }
}
