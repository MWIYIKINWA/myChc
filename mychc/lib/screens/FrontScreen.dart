import 'package:flutter/material.dart';
import 'package:mychc/screens/loginPage.dart';
import 'package:mychc/widgets/my_button.dart';

class Frontscreen extends StatelessWidget {
  const Frontscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [const Color.fromARGB(255, 255, 255, 255), Colors.white],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage('assets/images/mychc_no_bg.png'),
                height: 50.0,
                fit: BoxFit.fill,
              ),
              SizedBox(height: 20),
              Text(
                "Daily devotions, Sermons, Church News",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 10,
                ),
              ),
              SizedBox(height: 20),
              Custombutton(
                buttonText: "Get Started",
                action: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Loginpage()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
