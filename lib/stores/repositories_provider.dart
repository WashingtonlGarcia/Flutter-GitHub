import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_flutter/services/github_service.dart';
import '../models/repository.dart';

class RepositoriesProvider extends ChangeNotifier {
  List<Repository> repositories;

  RepositoriesProvider() {
    repositories = [];
  }

  Future<void> addRepository(String value, Function onSucess, Function onError) async {
    final Repository repository = await GitHubService().getRepositoryGitHub(value, onError);
    if (repository?.id == null) return;
    if (!repositories.any((Repository rep) => rep.id == repository.id)) {
      repositories.add(repository);
      onSucess('Foi adicionado: ${repository.fullName}');
      notifyListeners();
    } else {
      onError('Ja existe: ${repository.fullName}');
    }
  }

  void removeRepository(int id) {
    if (repositories.any((Repository rep) => rep.id == id)) {
      repositories.removeWhere((element) => element.id == id);
      notifyListeners();
    }
  }
}
