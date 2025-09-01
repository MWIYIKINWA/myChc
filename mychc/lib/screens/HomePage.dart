// import 'package:flutter/material.dart';
// import 'package:mychc/controllers/auth_controller.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final List<Map<String, String>> videos = [
//     {
//       'title': 'Ezekiel Setting Out',
//       'url': 'https://www.youtube.com/watch?v=12V_BiNSBrE',
//     },
//     {
//       'title': 'Hes Bruised Under My Feet',
//       'url': 'https://www.youtube.com/watch?v=0O2N3SCFVFE',
//     },
//     {
//       'title': 'Deborah Setting Out',
//       'url': 'https://www.youtube.com/watch?v=GdVzFT-T79g',
//     },
//     {
//       'title': 'Setting out with a blessing',
//       'url': 'https://www.youtube.com/watch?v=htMLA1D6IJM&t=306s',
//     },
//   ];

//   final List<Map<String, String>> churchNews = [
//     {'title': 'Back to School Outreach', 'image': 'assets/images/chc1.jpeg'},
//     {'title': 'Community Cleanup Drive', 'image': 'assets/images/chc2.jpg'},
//     {'title': 'Youth Prayer Night', 'image': 'assets/images/chc3.jpg'},
//     {'title': 'Thanksgiving Service', 'image': 'assets/images/chc4.jpg'},
//   ];

//   final List<Map<String, String>> churchEvents = [
//     {'title': 'Worship Evening', 'poster': 'assets/images/chc1.jpeg'},
//     {'title': 'Youth Conference', 'poster': 'assets/images/chc2.jpg'},
//     {'title': 'March Baptism', 'poster': 'assets/images/chc3.jpg'},
//   ];

//   final List<Map<String, String>> churchProgram = [
//     {
//       'title': 'Morning Service',
//       'address': 'Church, Wakiso',
//       'time': 'Sun 8 AM-10 AM,',
//     },
//     {
//       'title': 'Main Service',
//       'address': 'Church, Wakiso',
//       'time': 'Sun 10 AM- 1 PM,',
//     },
//     {
//       'title': 'Midweek Service',
//       'address': 'Church, Wakiso',
//       'time': 'Thursday 10 AM- 1 PM,',
//     },
//   ];

//   final List<Map<String, String>> audioMessages = [
//     {'title': 'Prayer and Fasting', 'speaker': 'Pastor John'},
//     {'title': 'Faith in Difficult Times', 'speaker': 'Pastor Sarah'},
//     {'title': 'The Power of Love', 'speaker': 'Pastor Mike'},
//     {'title': 'Walking in Purpose', 'speaker': 'Pastor Grace'},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           margin: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               //...................................
//               SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Hello, Isaac Prosper",
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 15.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10),
//               //..........................................
//               Text(
//                 "Devotion",
//                 style: TextStyle(color: Colors.orange, fontSize: 15.0),
//               ),
//               Card(
//                 margin: EdgeInsets.symmetric(vertical: 10),
//                 color: Colors.orange,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Family Series: The Threefold Cord",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         "Trust in the Lord with all your heart and lean not on your own understanding...",
//                         style: TextStyle(fontSize: 16, color: Colors.black),
//                       ),
//                       SizedBox(height: 8),
//                       Text(
//                         "20 Aug, 2025",
//                         style: TextStyle(
//                           fontSize: 10,
//                           color: const Color.fromARGB(137, 48, 47, 47),
//                         ),
//                       ),
//                       SizedBox(height: 8),
//                     ],
//                   ),
//                 ),
//               ),
//               //..........................................
//               Text(
//                 "Latest Sermons",
//                 style: TextStyle(color: Colors.orange, fontSize: 15.0),
//               ),
//               SizedBox(
//                 height: 180,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: videos.length,
//                   itemBuilder: (context, index) {
//                     final video = videos[index];
//                     final url = video['url']!;
//                     final videoId = Uri.parse(
//                       url,
//                     ).queryParameters['v']; // Extract the video ID
//                     final thumbnailUrl =
//                         'https://img.youtube.com/vi/$videoId/0.jpg';

//                     return Container(
//                       width: 300,
//                       margin: EdgeInsets.only(right: 12),
//                       child: Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         elevation: 4,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.vertical(
//                                 top: Radius.circular(12),
//                               ),
//                               child: Image.network(
//                                 thumbnailUrl,
//                                 height: 130,
//                                 width: double.infinity,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.all(5.0),
//                               child: Text(
//                                 video['title']!,
//                                 style: TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),

//               //..........................................
//               SizedBox(height: 10),
//               Text(
//                 "Church Programs",
//                 style: TextStyle(color: Colors.orange, fontSize: 15.0),
//               ),
//               SizedBox(height: 10),

//               SizedBox(
//                 height: 80,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: churchProgram.length,
//                   itemBuilder: (context, index) {
//                     final program = churchProgram[index];
//                     return Container(
//                       width: 200,
//                       margin: EdgeInsets.only(right: 12),
//                       child: Card(
//                         color: Colors.orange,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         elevation: 4,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 program['title']!,
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 15,
//                                 ),
//                               ),
//                               Text(
//                                 program['address']!,
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 8,
//                                 ),
//                               ),
//                               Text(
//                                 program['time']!,
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 11,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(height: 10),
//               //..........................................
//               SizedBox(height: 10),
//               Text(
//                 "Church News",
//                 style: TextStyle(color: Colors.orange, fontSize: 15.0),
//               ),
//               SizedBox(height: 10),

//               SizedBox(
//                 height: 150,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: churchNews.length,
//                   itemBuilder: (context, index) {
//                     final news = churchNews[index];
//                     return Container(
//                       width: 240,
//                       margin: EdgeInsets.only(right: 12),
//                       child: Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(3),
//                         ),
//                         elevation: 4,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.vertical(
//                                 top: Radius.circular(12),
//                               ),

//                               child: Image(
//                                 image: AssetImage(news['image']!),
//                                 height: 100.0,
//                                 width: double.infinity,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),

//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 news['title']!,
//                                 style: TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.bold,
//                                 ),

//                                 // overflow: TextOverflow.ellipsis,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(height: 10),
//               //---------------------------------------
//               Text(
//                 "Audio Sermons",
//                 style: TextStyle(color: Colors.orange, fontSize: 15.0),
//               ),
//               SizedBox(
//                 height: 140,
//                 child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: audioMessages.length,
//                   itemBuilder: (context, index) {
//                     final audio = audioMessages[index];
//                     return Container(
//                       width: 170,
//                       margin: EdgeInsets.only(right: 12),
//                       child: Card(
//                         color: Colors.blue[50],
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         elevation: 2,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Icon(
//                                 Icons.multitrack_audio_outlined,
//                                 size: 30,
//                                 color: Colors.orange,
//                               ),
//                               SizedBox(height: 8),
//                               Text(
//                                 audio['title']!,
//                                 style: TextStyle(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 textAlign: TextAlign.center,
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                               SizedBox(height: 4),
//                               Text(
//                                 audio['speaker']!,
//                                 style: TextStyle(
//                                   fontSize: 10,
//                                   color: Colors.grey[600],
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               //.........................................
//               SizedBox(height: 10),
//               Text(
//                 "UPCOMING EVENTS",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 15.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 10),

//               SizedBox(
//                 height: 300,
//                 child: ListView.builder(
//                   scrollDirection: Axis.vertical,
//                   itemCount: churchEvents.length,
//                   itemBuilder: (context, index) {
//                     final events = churchEvents[index];
//                     return Container(
//                       width: 200,
//                       margin: EdgeInsets.only(right: 12),
//                       child: Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         // elevation: 4,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             ClipRRect(
//                               borderRadius: BorderRadius.vertical(
//                                 top: Radius.circular(12),
//                               ),

//                               child: Image(
//                                 image: AssetImage(events['poster']!),
//                                 height: 100.0,
//                                 width: double.infinity,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),

//                             Padding(
//                               padding: const EdgeInsets.all(8.0),
//                               child: Text(
//                                 events['title']!,
//                                 style: TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.bold,
//                                 ),

//                                 // overflow: TextOverflow.ellipsis,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(height: 10),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mychc/controllers/auth_controller.dart';
import 'package:mychc/models/sermon_video_list.dart';
import 'package:mychc/screens/AudioSermons.dart';
import 'package:mychc/screens/ChurchEvents.dart';
import 'package:mychc/screens/ChurchNews.dart';
import 'package:mychc/screens/VideoSermons.dart';
import 'package:mychc/services/api_service.dart';

final videoListProvider = FutureProvider<SermonVideoList>((ref) {
  final apiService = ApiService();
  return apiService.getVideosList();
});

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get the current user from auth state
    final authState = ref.watch(authControllerProvider);
    final userName = authState.value?.name ?? 'User';

    final videosAsync = ref.watch(videoListProvider);

    final List<Map<String, String>> churchNews = [
      {
        'title': 'Thanksgiving Service',
        'image': 'assets/images/chc4.jpg',
        'details':
            'Christians from across Norfolk and Waveney gathered at St John the Baptist’s Cathedral for the annual Ecumenical Thanksgiving Service hosted by Churches Together. The event, held on the Feast of Christ the King, brought together believers of all traditions to celebrate unity and express gratitude.',
        'author': 'Church Admin',

        'date': '23 May, 2025',
      },
      {
        'title': 'Back to School Outreach',
        'image': 'assets/images/chc1.jpeg',
        'details':
            'This past Saturday, Mission Group of the World Mission Society Church of God stepped out of the sanctuary and into the Nansana High School for an outreach, Cleanup along Hoima Road. Dozens of volunteers donned gloves and bright yellow vests, collecting trash and beautifying the area.',
        'author': 'Church Admin',
        'date': '23 May, 2025',
      },
      {
        'title': 'Community Cleanup Drive',
        'image': 'assets/images/chc2.jpg',
        'details':
            'On this day, Church Members stepped out of the sanctuary and into the streets for a neighborhood cleanup along 55th Street and Raytown Road. Dozens of volunteers donned gloves and bright yellow vests, collecting trash and beautifying the area',
        'author': 'Church Admin',
        'date': '23 May, 2025',
      },
      {
        'title': 'Youth Prayer Night',
        'image': 'assets/images/chc3.jpg',
        'details':
            'More than 2,000 young adults gathered at Saint Church’s Hackney location for an all-night prayer and worship event that ran from 7 p.m. to 7 a.m. The multi-church gathering, organized by Saint Church, King’s Cross Church, and Imprint Church, was marked by spontaneous worship, deep repentance, and dozens of salvations.',
        'author': 'Church Admin',
        'date': '23 May, 2025',
      },
    ];

    final List<Map<String, String>> churchEvents = [
      {
        'title': 'Worship Evening',
        'poster': 'assets/images/chc1.jpeg',
        'date': '13 Aug, 2025',
        'time': '06PM - 09PM',
      },
      {
        'title': 'Youth Conference',
        'poster': 'assets/images/chc2.jpg',
        'date': '12 Sep, 2025',
        'time': '08AM - 06PM',
      },
      {
        'title': 'March Baptism',
        'poster': 'assets/images/chc3.jpg',
        'date': '12 Mar, 2026',
        'time': '08AM - 06PM',
      },
    ];

    final List<Map<String, String>> churchProgram = [
      {
        'title': 'Morning Service',
        'address': 'Church, Wakiso',
        'time': 'Sun 8 AM-10 AM,',
      },
      {
        'title': 'Main Service',
        'address': 'Church, Wakiso',
        'time': 'Sun 10 AM- 1 PM,',
      },
      {
        'title': 'Midweek Service',
        'address': 'Church, Wakiso',
        'time': 'Thursday 10 AM- 1 PM,',
      },
    ];

    final List<Map<String, String>> audioMessages = [
      {
        'title': 'Prayer and Fasting',
        'speaker': 'Pastor John',

        'url': 'assets/audios/1.mp3',
      },
      {
        'title': 'Faith in Difficult Times',
        'speaker': 'Pastor Sarah',
        'url': 'assets/audios/2.mp3',
      },
      {
        'title': 'The Power of Love',
        'speaker': 'Pastor Mike',
        'url': 'assets/audios/1.mp3',
      },
      {
        'title': 'Walking in Purpose',
        'speaker': 'Pastor Grace',
        'url': 'assets/audios/2.mp3',
      },
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //...................................
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hello, $userName", // Logged in user
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              //..........................................
              Text(
                "Devotion",
                style: TextStyle(color: Colors.orange, fontSize: 15.0),
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10),
                color: Colors.orange,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Family Series: The Threefold Cord",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Trust in the Lord with all your heart and lean not on your own understanding...",
                        style: TextStyle(fontSize: 13, color: Colors.black),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "20 Aug, 2025",
                        style: TextStyle(
                          fontSize: 10,
                          color: const Color.fromARGB(137, 48, 47, 47),
                        ),
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
              //..........................................
              Text(
                "Latest Sermons",
                style: TextStyle(color: Colors.orange, fontSize: 15.0),
              ),

              videosAsync.when(
                loading: () => SizedBox(
                  height: 200,
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (error, stack) => SizedBox(
                  height: 200,
                  child: Center(child: Text('Error loading videos')),
                ),
                data: (videoList) {
                  // Take only the first 4 videos
                  final firstFourVideos = videoList.items.take(4).toList();

                  return SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: firstFourVideos.length,
                      itemBuilder: (context, index) {
                        final video = firstFourVideos[index];
                        final videoId = video.snippet.resourceId.videoId;
                        final publishedDate = video.snippet.publishedAt;
                        final dateString =
                            '${publishedDate.day}/${publishedDate.month}/${publishedDate.year}';
                        final thumbnailUrl =
                            'https://img.youtube.com/vi/$videoId/0.jpg';

                        return Container(
                          width: 300,
                          margin: EdgeInsets.only(right: 12),
                          child: GestureDetector(
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
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 4,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(12),
                                    ),
                                    child: Image.network(
                                      thumbnailUrl,
                                      height: 130,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Container(
                                              height: 130,
                                              color: Colors.grey[300],
                                              child: Icon(Icons.error),
                                            );
                                          },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      video.snippet.title,
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),

              //..........................................
              SizedBox(height: 10),
              Text(
                "Church Programs",
                style: TextStyle(color: Colors.orange, fontSize: 15.0),
              ),
              SizedBox(height: 10),

              SizedBox(
                height: 80,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: churchProgram.length,
                  itemBuilder: (context, index) {
                    final program = churchProgram[index];
                    return Container(
                      width: 200,
                      margin: EdgeInsets.only(right: 12),
                      child: Card(
                        color: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                program['title']!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                program['address']!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 8,
                                ),
                              ),
                              Text(
                                program['time']!,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              //..........................................
              SizedBox(height: 10),
              Text(
                "Church News",
                style: TextStyle(color: Colors.orange, fontSize: 15.0),
              ),
              SizedBox(height: 10),

              SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: churchNews.length,
                  itemBuilder: (context, index) {
                    final news = churchNews[index];
                    return Container(
                      width: 240,
                      margin: EdgeInsets.only(right: 12),
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,

                            MaterialPageRoute(
                              builder: (context) => ChurchNewsDetail(
                                title: news['title']!,
                                imagePath: news['image']!,
                                details: news['details']!,
                                date: news['date']!,
                                author: news['author']!,
                              ),
                            ),
                          ),
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3),
                          ),
                          elevation: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),

                                child: Image(
                                  image: AssetImage(news['image']!),
                                  height: 100.0,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  news['title']!,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),

                                  // overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
              //---------------------------------------
              Text(
                "Audio Sermons",
                style: TextStyle(color: Colors.orange, fontSize: 15.0),
              ),
              SizedBox(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: audioMessages.length,
                  itemBuilder: (context, index) {
                    final audio = audioMessages[index];
                    return Container(
                      width: 170,
                      margin: EdgeInsets.only(right: 12),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AudioPage(
                                title: audio['title']!,
                                speaker: audio['speaker']!,
                                url: audio['url']!,
                              ),
                            ),
                          );
                        },
                        child: Card(
                          color: Colors.blue[50],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.multitrack_audio_outlined,
                                  size: 30,
                                  color: Colors.orange,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  audio['title']!,
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  audio['speaker']!,
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.grey[600],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              //.........................................
              SizedBox(height: 10),
              Text(
                "UPCOMING EVENTS",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),

              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: churchEvents.length,
                  itemBuilder: (context, index) {
                    final events = churchEvents[index];
                    return Container(
                      width: 200,
                      margin: EdgeInsets.only(right: 12),
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ChurchEventDetail(
                                title: events['title']!,
                                imagePath: events['poster']!,
                                date: events['date']!,
                                time: events['time']!,
                              ),
                            ),
                          ),
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          // elevation: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(12),
                                ),

                                child: Image(
                                  image: AssetImage(events['poster']!),
                                  height: 100.0,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  events['title']!,
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                  ),

                                  // overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
