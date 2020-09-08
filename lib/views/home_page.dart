import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_flutter/stores/repositories_provider.dart';
import 'package:github_flutter/widgets/message_widget.dart';

import 'package:provider/provider.dart';

import '../widgets/home/home.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/home';

  final GlobalKey<ScaffoldState> _keyScaffold = GlobalKey<ScaffoldState>();

  GlobalKey<ScaffoldState> get keyScaffold => _keyScaffold;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: keyScaffold,
      appBar: AppBarWidget(),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Consumer<RepositoriesProvider>(
      builder: (_, repositoryManager, child) => Column(
        children: [
          child,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),
          if (repositoryManager.repositories.isNotEmpty)
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: repositoryManager.repositories.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 8),
                    child: ListTileWidget(
                      delete: repositoryManager.removeRepository,
                      repository: repositoryManager.repositories[index],
                    ),
                  );
                },
              ),
            )
          else
            const Expanded(
                child: MessageWidget(
              message: 'Nenhum repositorio encontrado!',
              iconData: Icons.receipt,
            ))
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: TextFormFieldWidget(
          onFieldSubmmitted: (String value) {
            context.read<RepositoriesProvider>().addRepository(value, (String value) {
              keyScaffold.currentState.showSnackBar(SnackBar(
                content: Text(value),
                backgroundColor: Colors.green,
                duration: const Duration(milliseconds: 1000),
              ));
            }, (String value) {
              keyScaffold.currentState.showSnackBar(SnackBar(
                content: Text(value),
                backgroundColor: Colors.red,
                duration: const Duration(milliseconds: 1000),
              ));
            });
          },
          validator: (String value) {
            if (value.trim().isEmpty) return 'Campo obrigatorio';
            return null;
          },
          hintText: 'Adicionar repositorio',
        ),
      ),
    );
  }
}
