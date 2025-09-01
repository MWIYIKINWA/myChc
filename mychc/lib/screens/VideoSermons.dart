import 'package:flutter/material.dart';
import 'package:mychc/services/api_service.dart';
import 'package:mychc/models/sermon_video_list.dart';
import 'package:mychc/models/sermons_model.dart' hide Item;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoSermons extends StatefulWidget {
  const VideoSermons({super.key});

  @override
  State<VideoSermons> createState() => _VideoSermonsState();
}

class _VideoSermonsState extends State<VideoSermons> {
  final ApiService _apiService = ApiService();
  List<Item> _videos = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchVideos();
  }

  Future<void> _fetchVideos() async {
    try {
      final SermonVideoList videoList = await _apiService.getVideosList();

      setState(() {
        _videos = videoList.items;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = "Sorry dear, We can't fetch any Sermons ";
        //e.toString()
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
          ? Center(child: Text(_errorMessage!))
          : _videos.isEmpty
          ? const Center(child: Text("No videos available"))
          : ListView.builder(
              itemCount: _videos.length,
              itemBuilder: (context, index) {
                final video = _videos[index];
                final thumbnailUrl =
                    video.snippet.thumbnails.medium?.url ??
                    video.snippet.thumbnails.high?.url ??
                    video.snippet.thumbnails.defaultThumbnail?.url ??
                    'https://via.placeholder.com/100x60';

                final publishedDate = video.snippet.publishedAt;
                final dateString =
                    '${publishedDate.day}/${publishedDate.month}/${publishedDate.year}';

                return GestureDetector(
                  onTap: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideoSermonsPlayer(
                          videoId: video.snippet.resourceId.videoId,
                          videoTitle: video.snippet.title,
                          dateString: dateString,
                        ),
                      ),
                    ),
                  },

                  child: Card(
                    margin: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          thumbnailUrl,
                          width: double.infinity,
                          height: 200,
                          fit: BoxFit.fill,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              height: 150,
                              color: Colors.white,
                              child: const Icon(Icons.error),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 8, 5, 2),
                          child: Text(
                            video.snippet.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                          child: Text(
                            dateString,
                            style: const TextStyle(fontSize: 10),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

// VIDEO PLAYER PAGE

class VideoSermonsPlayer extends StatefulWidget {
  final String videoId;
  final String videoTitle;
  final String dateString;

  const VideoSermonsPlayer({
    super.key,
    required this.videoId,
    required this.videoTitle,
    required this.dateString,
  });

  @override
  State<VideoSermonsPlayer> createState() => _VideoSermonsPlayerState();
}

class _VideoSermonsPlayerState extends State<VideoSermonsPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(autoPlay: true, mute: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],

        title: Text("WATCH SERMON", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(
              widget.videoTitle,
              style: TextStyle(
                color: Colors.orange,
                fontSize: 17.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              widget.dateString,
              style: TextStyle(
                color: Colors.black,
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
