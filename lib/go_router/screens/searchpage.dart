import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  static const String route = '/search';
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
    );
  }
}