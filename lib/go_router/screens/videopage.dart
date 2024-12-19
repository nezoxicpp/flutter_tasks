import 'package:flutter/material.dart';

class VideoPage extends StatelessWidget {
  static const String route = '/videos';
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Videos'),
      ),
    );
  }
}