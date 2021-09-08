import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Listas')),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 3));
        },
        child: ListView.builder(
          itemBuilder: (_, i) => GestureDetector(
            onTap: () {
              print('==== CLICK ===== $i');
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text('$i'),
              ),
            ),
          ),
          itemCount: 24,
        ),
      ),
    );
  }
}
