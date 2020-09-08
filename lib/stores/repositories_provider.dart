import 'package:flutter/cupertino.dart';
import 'package:github_flutter/services/github_service.dart';
import '../models/repository.dart';

class RepositoriesProvider extends ChangeNotifier {
  List<Repository> repositories;

  RepositoriesProvider() {
    repositories = [];
  }

  Future<void> addRepository(String value) async {
    final Repository repository = await GitHubService().getRepositoryGitHub(value: value);
    if (!repositories.any((Repository rep) => rep.id == repository.id)) {
      repositories.add(repository);
      notifyListeners();
    }
  }

  void removeRepository(int id) {
    if (repositories.any((Repository rep) => rep.id == id)) {
      repositories.removeWhere((element) => element.id == id);
      notifyListeners();
    }
  }
}
