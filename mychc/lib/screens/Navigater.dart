import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mychc/controllers/auth_controller.dart';
import 'package:mychc/screens/ChurchNews.dart';
import 'package:mychc/screens/Devotions.dart';
import 'package:mychc/screens/HomePage.dart';
import 'package:mychc/screens/VideoSermons.dart';
import 'package:mychc/screens/loginPage.dart';

class NavigatePage extends ConsumerStatefulWidget {
  const NavigatePage({super.key});

  @override
  ConsumerState<NavigatePage> createState() => _NavigatePageState();
}

class _NavigatePageState extends ConsumerState<NavigatePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authControllerProvider);
    final user = authState.value;

    // Define your pages here
    final List<Widget> _pages = [
      HomePage(),
      Devotions(),
      VideoSermons(),
      ChurchNews(),
    ];

    final List<String> _titles = ['Today', 'Devotions', 'Sermons', 'News'];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        //logo
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: const Image(
            image: AssetImage('assets/images/mychc.png'),
            height: 40.0,
          ),
        ),
        //title
        title: Text(
          _titles[_currentIndex],
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        //logout button
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: () {
              if (user != null && user.token != null) {
                ref.read(authControllerProvider.notifier).logout(user.token!);
              }
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => Loginpage()),
              );
            },
          ),
        ],
      ),

      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.orange,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.mic), label: 'Devotions'),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Sermons',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
        ],
      ),
    );
  }
}
