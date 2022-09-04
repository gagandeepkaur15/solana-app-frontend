import 'package:flutter/material.dart';
import './home_page_content.dart';
import './profile_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:anim_search_bar/anim_search_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController(); // for search bar
  int _selectedIndex = 0;
  String src =
      'https://images.unsplash.com/photo-1473081556163-2a17de81fc97?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8bGVhdmVzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60';
  //list of screens for navigation bar
  final screens = [
    HomePageContent(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(src),
        )),
        child: Scaffold(
          backgroundColor: Color.fromARGB(0, 248, 0, 0),
          appBar: AppBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            backgroundColor: Color.fromARGB(0, 40, 190, 172),
            elevation: 0,
            title: AnimSearchBar(
              color: Color.fromARGB(0, 255, 255, 255),
              rtl: true,
              width: 300,
              style: TextStyle(
                color: Colors.white70,
              ),
              textController: textController,
              closeSearchOnSuffixTap: true,
              prefixIcon: Icon(
                Icons.search,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              suffixIcon: Icon(
                Icons.search_rounded,
                color: Color.fromARGB(255, 255, 250, 250),
              ),
              onSuffixTap: () {
                setState(() {
                  textController.clear();
                });
              },
            ),
          ),
          body: Container(
            color: Colors.transparent,
            height: double.infinity,
            width: double.infinity,
            child: screens[_selectedIndex],
          ),

          //Bottom Navigation Bar
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(9, 255, 255, 255),
                boxShadow: [
                  BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
                ]),
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                child: GNav(
                  color: Colors.white60,
                  gap: 8,
                  activeColor: Color.fromARGB(255, 0, 0, 0),
                  iconSize: 24,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  duration: Duration(milliseconds: 300),
                  tabBackgroundColor: Color.fromARGB(255, 40, 190, 172),
                  tabs: [
                    GButton(
                      icon: LineIcons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: LineIcons.user,
                      text: 'Profile',
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(
                      () {
                        _selectedIndex = index;
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
