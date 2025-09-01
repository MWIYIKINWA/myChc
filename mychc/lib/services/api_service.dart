import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mychc/models/devotion_model.dart';
import 'package:mychc/models/sermon_video_list.dart';
import 'package:mychc/models/sermons_model.dart';
import 'package:mychc/models/user_model.dart';
import 'package:mychc/services/constants.dart';

class ApiService {
  //static const String baseUrl = 'http://127.0.0.1:8000/api';
  static const String baseUrl = 'https://mychc.ssengebaptistchurch.org/api';

  final utubeapiKey = Constants.youtube_API_Key;
  final utubechannelId = Constants.youtube_Channel_ID;
  final utubebaseUrl = Constants.google_Base_Url;
  final utubeplaylistId = Constants.youtube_Playlist_Id;

  //  AUTH...............................................
  //login.................................................

  Future<User> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({'email': email, 'password': password}),
      );

      final Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200) {
        // Check if the response contains errors (your API returns 200 even for auth failures)
        if (responseData.containsKey('errors')) {
          // Extract error message from the errors array
          final errors = responseData['errors'];
          final errorMessage = errors['email']?.first ?? 'Invalid credentials';
          throw Exception(errorMessage);
        }

        // Success case - user data with token
        return User.fromJson(responseData);
      } else {
        // Handle other error cases
        final errorMessage = responseData['message'] ?? 'Login failed';
        throw Exception(errorMessage);
      }
    } catch (e) {
      throw Exception('An error occurred: ${e.toString()}');
    }
  }

  Future<User> register(
    String name,
    String email,
    String password,
    String passwordConfirmation,
  ) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/register'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: json.encode({
          'name': name,
          'email': email,
          'password': password,
          'password_confirmation': passwordConfirmation,
        }),
      );

      final Map<String, dynamic> responseData = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Check for errors in successful status code responses
        if (responseData.containsKey('errors')) {
          final errors = responseData['errors'];
          final errorMessage =
              errors.values.first?.first ?? 'Registration failed';
          throw Exception(errorMessage);
        }

        return User.fromJson(responseData);
      } else {
        final errorMessage = responseData['message'] ?? 'Registration failed';
        throw Exception(errorMessage);
      }
    } catch (e) {
      throw Exception('An error occurred during registration: ${e.toString()}');
    }
  }

  //logout.................................................

  Future<void> logout(String token) async {
    final response = await http.post(
      Uri.parse('$baseUrl/logout'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Logout failed');
    }
  }

  //DEVOTIONS
  // Add to your ApiService class
  Future<List<Devotion>> getDevotions(String? token) async {
    try {
      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      // Add authorization header if token exists
      if (token != null) {
        headers['Authorization'] = 'Bearer $token';
      }

      final response = await http.get(
        Uri.parse('$baseUrl/sermons'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => Devotion.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load devotions: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('An error occurred: ${e.toString()}');
    }
  }

  //get video sermons

  Future<Sermons> getChannelDetails() async {
    Map<String, String> parameters = {
      'part': 'snippet,contentDetails,statistics',
      'id': utubechannelId,
      'key': utubeapiKey,
    };

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    Uri uri = Uri.https(utubebaseUrl, '/youtube/v3/channels', parameters);

    http.Response response = await http.get(uri, headers: headers);

    //print(response.body);

    Sermons sermonsChannel = sermonsFromJson(response.body);

    return sermonsChannel;
  }

  Future<SermonVideoList> getVideosList({
    String? playlistId,
    String pageToken = "",
  }) async {
    Map<String, String> parameters = {
      'part': 'snippet',
      'playlistId': playlistId ?? utubeplaylistId,
      'key': utubeapiKey,
      'maxResults': '8',
      'pageToken': pageToken,
    };

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    Uri uri = Uri.https(utubebaseUrl, '/youtube/v3/playlistItems', parameters);

    http.Response response = await http.get(uri, headers: headers);

    //print(response.body);

    SermonVideoList videoList = sermonVideoListFromJson(response.body);

    return videoList;
  }
}
