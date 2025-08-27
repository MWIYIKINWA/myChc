import 'package:flutter/material.dart';

class ChurchEventDetail extends StatelessWidget {
  final String title;
  final String imagePath;
  final String date;
  final String time;

  const ChurchEventDetail({
    super.key,
    required this.title,
    required this.imagePath,
    required this.date,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],

        title: Text("Happenings", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //display event title
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

            //display event poster
            SizedBox(height: 20),

            ClipRRect(
              borderRadius: BorderRadius.circular(
                12.0,
              ), // Adjust the radius as needed
              child: Image(
                image: AssetImage(imagePath),
                height: 250.0,
                fit: BoxFit.fill,
              ),
            ),
            //Image(image: AssetImage(imagePath),  height: 250.0, fit: BoxFit.fill,),
            SizedBox(height: 20),

            Icon(Icons.punch_clock_sharp, color: Colors.orange, size: 30.0),

            //display event time
            Text(time, style: const TextStyle(fontSize: 16)),

            SizedBox(height: 20),

            //display event date
            Icon(Icons.date_range_outlined, color: Colors.orange, size: 30.0),

            Text(
              date,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Contact Us",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.orange,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 60.0,
                vertical: 10.0,
              ),
              child: Divider(height: 10, color: Colors.orange),
            ),
            Text(
              "0756151375",
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
            Text(
              "myChc@gmail.com",
              style: TextStyle(fontSize: 10, color: Colors.black),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
