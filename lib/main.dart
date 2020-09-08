import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'routes/routes.dart';
import 'stores/repositories_provider.dart';

void main() => runApp(ChangeNotifierProvider(
      lazy: true,
      create: (_) => RepositoriesProvider(),
      child: MaterialApp(
        onGenerateRoute: Routes.onGenerateRoute,
        theme: ThemeData(
         scaffoldBackgroundColor: Colors.grey[200]
        ),
      ),
    ));
