import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_flutter/models/repository.dart';

class ListTileWidget extends StatelessWidget {
  final Repository repository;

  final void Function(int) delete;

  const ListTileWidget({
    @required this.repository,
    @required this.delete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      resizeDuration: const Duration(milliseconds: 500),
      direction: DismissDirection.startToEnd,
      movementDuration: const Duration(milliseconds: 500),
      background: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.red,
        ),
        child: const Align(
          alignment: Alignment(-0.9, 0),
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      key: Key(repository.id.toString()),
      onDismissed: (_) => delete(repository.id),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(360),
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.network(
                    repository.avatarUrl,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  children: [
                    Text(
                      repository.fullName,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      repository.description,
                      style: TextStyle(
                        color: Colors.grey[800],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
