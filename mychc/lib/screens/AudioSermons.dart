import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:path_provider/path_provider.dart';
import 'package:dio/dio.dart';
import 'dart:io';

class AudioPage extends StatefulWidget {
  final String title;
  final String speaker;
  final String url;

  AudioPage({required this.title, required this.speaker, required this.url});

  @override
  _AudioPageState createState() => _AudioPageState();
}

class _AudioPageState extends State<AudioPage> {
  late AudioPlayer _player;
  bool _isPlaying = false;
  bool _downloading = false;
  final audio_player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
    //_player.setUrl(widget.url);
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  Future<void> _downloadAudio() async {
    setState(() => _downloading = true);

    try {
      final dir = await getApplicationDocumentsDirectory();
      final filePath = '${dir.path}/${widget.title.replaceAll(' ', '_')}.mp3';
      await Dio().download(widget.url, filePath);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Downloaded to $filePath')));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Download failed: $e')));
    } finally {
      setState(() => _downloading = false);
    }
  }

  // Future<void> _togglePlayPause(path) async {
  //   if (_isPlaying) {
  //     await audio_player.play(AssetSource(path));
  //   } else {
  //     await audio_player.pause();
  //   }
  //   setState(() => _isPlaying = !_isPlaying);
  // }

  Future<void> _togglePlayPause() async {
    try {
      if (_isPlaying) {
        await _player.pause();
      } else {
        // Check if the URL is a network URL or local asset
        if (widget.url.startsWith('http')) {
          await _player.play(UrlSource(widget.url));
        } else {
          await _player.play(AssetSource(widget.url));
        }
      }
      setState(() => _isPlaying = !_isPlaying);
    } catch (e) {
      print('Error playing audio: $e');
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error playing audio: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],

        title: Text("Listen", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Icon(
                Icons.multitrack_audio_outlined,
                size: 100,
                color: Colors.orange,
              ),
              SizedBox(height: 20),
              Text(
                widget.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Text(
                'by ${widget.speaker}',
                style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              ),

              //player
              SizedBox(height: 40),
              ElevatedButton.icon(
                icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
                label: Text(_isPlaying ? 'Pause' : 'Play'),
                onPressed: _togglePlayPause,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
              //downloader
              SizedBox(height: 20),
              ElevatedButton.icon(
                icon: _downloading
                    ? SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Icon(Icons.download, color: Colors.white),
                label: Text(
                  _downloading ? 'Downloading...' : 'Download Audio',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: _downloading ? null : _downloadAudio,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
