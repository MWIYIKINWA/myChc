// ignore: file_names
import 'package:flutter/material.dart';

class ChurchNews extends StatefulWidget {
  const ChurchNews({super.key});

  @override
  State<ChurchNews> createState() => _ChurchNewsState();
}

class _ChurchNewsState extends State<ChurchNews> {
  final List<Map<String, String>> churchNews = [
    {
      'title': 'Thanksgiving Service',
      'image': 'assets/images/chc4.jpg',
      'details':
          'Christians from across Norfolk and Waveney gathered at St John the Baptist’s Cathedral for the annual Ecumenical Thanksgiving Service hosted by Churches Together. The event, held on the Feast of Christ the King, brought together believers of all traditions to celebrate unity and express gratitude.',
      'author': 'Isaac Prosper',
      'date': '25 Aug, 2025',
    },
    {
      'title': 'Back to School Outreach',
      'image': 'assets/images/chc1.jpeg',
      'details':
          'This past Saturday, Mission Group of the World Mission Society Church of God stepped out of the sanctuary and into the Nansana High School for an outreach, Cleanup along Hoima Road. Dozens of volunteers donned gloves and bright yellow vests, collecting trash and beautifying the area.',
      'author': 'Church Admin',
      'date': '25 Aug, 2025',
    },
    {
      'title': 'Community Cleanup Drive',
      'image': 'assets/images/chc2.jpg',
      'details':
          'On this day, Church Members stepped out of the sanctuary and into the streets for a neighborhood cleanup along 55th Street and Raytown Road. Dozens of volunteers donned gloves and bright yellow vests, collecting trash and beautifying the area',
      'author': 'Church Admin',
      'date': '23 Aug, 2025',
    },
    {
      'title': 'Youth Prayer Night',
      'image': 'assets/images/chc3.jpg',
      'details':
          'More than 2,000 young adults gathered at Saint Church’s Hackney location for an all-night prayer and worship event that ran from 7 p.m. to 7 a.m. The multi-church gathering, organized by Saint Church, King’s Cross Church, and Imprint Church, was marked by spontaneous worship, deep repentance, and dozens of salvations.',
      'author': 'Church Admin',
      'date': '03 July, 2025',
    },
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //text
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              'Read and enjoy latest Church News, Have updates on whats happening',
              style: const TextStyle(
                fontFamily: 'Inspiration',
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          //news
          Expanded(
            child: ListView.builder(
              itemCount: churchNews.length,
              itemBuilder: (context, index) {
                final news = churchNews[index];
                return GestureDetector(
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
                    margin: const EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          news['image']!,
                          width: double.infinity,
                          height: 180,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            news['title']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            '${news['details']!.length > 40 ? news['details']!.substring(0, 100) : news['details']}...',
                            style: const TextStyle(
                              fontSize: 12,
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

//DETAILS

class ChurchNewsDetail extends StatelessWidget {
  final String title;
  final String imagePath;
  final String details;
  final String date;
  final String author;

  const ChurchNewsDetail({
    super.key,
    required this.title,
    required this.imagePath,
    required this.details,
    required this.date,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],

        title: Text("News", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.orange,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Divider(height: 10, color: Colors.orange),
            ),

            SizedBox(height: 20),

            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image(
                image: AssetImage(imagePath),
                height: 250.0,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(details, style: const TextStyle(fontSize: 13)),
            ),
            SizedBox(height: 20),

            Text(
              date,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 6),
            Text(
              author,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
