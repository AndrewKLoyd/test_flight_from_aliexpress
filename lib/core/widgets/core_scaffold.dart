import 'package:flutter/material.dart';

class CoreScaffold extends StatelessWidget {
  final String title;
  final Widget child;

  const CoreScaffold({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4),
        child: child,
      ),
    );
  }
}
