import 'package:flutter/material.dart';
import 'package:my_helper/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final items = <_ListModel>[
    _ListModel(name: 'Listas', route: AppRoutes.listPage),
    _ListModel(name: 'Painter', route: AppRoutes.painterPage),
    _ListModel(name: 'Custom App Bar', route: AppRoutes.appBarPage),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: ListView.builder(
        itemBuilder: (_, i) {
          final item = items[i];
          return Card(
            child: ListTile(
              title: Text(item.name),
              onTap: () => Navigator.of(context).pushNamed(item.route),
            ),
          );
        },
        itemCount: items.length,
      ),
    );
  }
}

class _ListModel {
  final String name;
  final String route;

  _ListModel({required this.name, required this.route});
}
