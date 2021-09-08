import 'package:flutter/material.dart';
import 'package:my_helper/pages/painter_page.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _MyAppBar(color: Colors.blue, title: 'Custom App Bar'),
      drawer: Drawer(),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 3));
        },
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 24),
          itemBuilder: (_, i) {
            return Card(
              elevation: 2,
              child: ListTile(title: Text('$i')),
            );
          },
          itemCount: 12,
        ),
      ),
    );
  }
}

class _MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _MyAppBar({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: AppBar4(color: color),
      child: AppBar(
        title: Text(title),
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(Icons.menu),
        ),
        elevation: 0,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
