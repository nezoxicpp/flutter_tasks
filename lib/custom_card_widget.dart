import 'package:flutter/material.dart';

class YouTubeVideoCard extends StatelessWidget {
  final String thumbnailUrl;
  final String videoTitle;
  final String videoDescription;

  const YouTubeVideoCard({
    Key? key,
    required this.thumbnailUrl,
    required this.videoTitle,
    required this.videoDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 350, // Set a fixed width for the card
        child: Card(
          margin: EdgeInsets.all(12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 4.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(12),
                    ),
                    child: Image.network(
                      thumbnailUrl,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: Icon(
                        Icons.play_circle_fill,
                        color: Colors.white.withOpacity(0.8),
                        size: 64,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      videoTitle,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 8),
                    Text(
                      videoDescription,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[600],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      appBar: AppBar(title: Text("YouTube Video Card")),
      body: ListView(
        children: [
          YouTubeVideoCard(
            thumbnailUrl:
                'https://stimg.cardekho.com/images/carexteriorimages/630x420/BMW/X5-2023/10452/1688992642182/front-left-side-47.jpg', // Replace with a valid image URL
            videoTitle: 'Flutter YouTube Video Tutorial',
            videoDescription: 'Learn how to build amazing apps using Flutter!',
          ),
          YouTubeVideoCard(
            thumbnailUrl:
                'https://img.youtube.com/vi/dQw4w9WgXcQ/0.jpg', // Another video card
            videoTitle: 'Another Video Title',
            videoDescription: 'Another description here!',
          ),
        ],
      ),
    ),
  ));
}
