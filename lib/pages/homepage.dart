import 'package:flutter/material.dart';

import '../pages/curved_navigation.dart';
import '../pages/profilepage.dart';
import '../pages/distress.dart';
import 'personalinfo.dart';
import './healthtips.dart';
import './auth.dart';
import './doctor.dart';
import './settings.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  Home zero;
  ProfilePage one;
  Distress two;
  List<Widget> pages;
  Widget currentpage;

  void initState() {
    zero = Home();
    one = ProfilePage();
    two = Distress();

    pages = [zero, one, two];
    currentpage = zero;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentpage,
      backgroundColor: Colors.blueAccent,
      bottomNavigationBar: CurvedNavigationBar(
        index: selectedIndex,
        backgroundColor: Color(0xFFF5F5F5),
        items: <Widget>[
          Icon(Icons.add, size: 30, color: Colors.blue),
          Icon(Icons.account_circle, size: 30, color: Colors.blue),
          Icon(Icons.compare_arrows, size: 30, color: Colors.blue),
          // Icon(Icons.list, size: 30, color: Colors.blue),
          // Icon(Icons.compare_arrows, size: 30, color: Colors.blue),
        ],
        onTap: (int index) {
          setState(() {
            selectedIndex = index;
            currentpage = pages[index];
          });
          //  Navigator.pushNamed(context, '/myprofile');
        },
      ),
    );
  }

  // switch (_selectedIndex) {
  //   case 0:
  //     Navigator.pushNamed(context, '/');
  //     break;
  //   case 1:
  //     Navigator.pushNamed(context, '/myprofile');
  //     break;
  //   case 2:
  //     Navigator.pushNamed(context, '/');
  //     break;
  //   default:
  // }

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/img/profile.jpg',),
              radius: 40,
            //   child: Image.asset(
            //   'assets/img/profile.jpg',
            //   height: 100,
            //   width: 100,
            // ),
            ),
            
            SizedBox(
              height: 30,
            ),
            Text(
              'Hello Aymen!',
              style: TextStyle(
                  color: Colors.blue,
                  fontFamily: 'Poppins',
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(),
            ListTile(
              trailing: Icon(Icons.arrow_right),
              leading: Icon(Icons.insert_emoticon),
              title: Text(
                'Personal Information',
                style: TextStyle(
                    fontSize: 16, color: Colors.grey, fontFamily: 'Poppins'),
              ),
              onTap: () {
                return Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => PersonalInfoPage()));
              },
            ),
            ListTile(
              trailing: Icon(Icons.arrow_right),
              leading: Icon(Icons.local_hospital),
              title: Text(
                'Vital Medical Info',
                style: TextStyle(
                    fontSize: 16, color: Colors.grey, fontFamily: 'Poppins'),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SearchList()));
              },
            ),
            ListTile(
              trailing: Icon(Icons.arrow_right),
              leading: Icon(Icons.settings),
              title: Text(
                'Settings',
                style: TextStyle(
                    fontSize: 16, color: Colors.grey, fontFamily: 'Poppins'),
              ),
              onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SettingsPage(),));
              },
            ),
            ListTile(
              trailing: Icon(Icons.arrow_right),
              leading: Icon(Icons.cancel),
              title: Text(
                'Log out',
                style: TextStyle(
                    fontSize: 16, color: Colors.grey, fontFamily: 'Poppins'),
              ),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => AuthPage(),));
              },
            ),
          ],
        ),
      ),
      appBar: _appBarBuild(),
      body: Center(
        //heightFactor: 50,
        child: Container(
          //padding: EdgeInsets.all(20),
          color: Color(0xFFF5F5F5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //verticalDirection: VerticalDirection.up,
                children: <Widget>[
                  _servicesCards1(context),
                  _servicesCards2(context),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // verticalDirection: VerticalDirection.up,
                children: <Widget>[
                  _servicesCards3(context),
                  _servicesCards4(context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _appBarBuild() {
  return AppBar(
    // leading: Icon(
    //   Icons.menu,
    //   color: Colors.blue,
    // ),
    iconTheme: IconThemeData(color: Colors.blue),
    title: Text(
      'Health Circle',
      style: TextStyle(
          color: Colors.blue,
          fontFamily: 'Poppins',
          fontSize: 24,
          fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    actions: <Widget>[
      Icon(
        Icons.more_vert,
        //color: Colors.blue,
        //size: 30,
      ),
    ],
    backgroundColor: Color(0xFFF5F5F5),
    elevation: 0.0,
  );
}

Widget _servicesCards1(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, '/medrec');
    },
    child: Container(
      child: Column(
        children: <Widget>[
          Image.asset('assets/img/mrecord.png', height: 60, width: 60),
          SizedBox(
            height: 10,
          ),
          Text(
            'Medical\n Records',
            style: TextStyle(fontFamily: 'Poppins', color: Colors.blue),
            textAlign: TextAlign.center,
          )
        ],
      ),
      margin: const EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 40.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey[400],
            offset: Offset(1.0, 6.0),
            blurRadius: 20.0,
            //spreadRadius: 10,
          ),
        ],
        color: Colors.white,
      ),
    ),
  );
}

Widget _servicesCards2(BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, '/contacts');
    },
    child: Container(
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/img/emergency.png',
            height: 60,
            width: 60,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Emergency\n Contacts',
            style: TextStyle(fontFamily: 'Poppins', color: Colors.blue),
            textAlign: TextAlign.center,
          )
        ],
      ),
      margin: const EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 40.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey[400],
            offset: Offset(1.0, 6.0),
            blurRadius: 20.0,
            //spreadRadius: 10,
          ),
        ],
        color: Colors.white,
      ),
    ),
  );
}

Widget _servicesCards3(BuildContext context) {
  return GestureDetector(
    onTap: () {
      return Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) =>HealthTipsPage()));
    },
    child: Container(
      child: Column(
        children: <Widget>[
          Image.asset(
            'assets/img/tips.png',
            height: 60,
            width: 60,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Health Tips\n Feed',
            style: TextStyle(fontFamily: 'Poppins', color: Colors.blue),
            textAlign: TextAlign.center,
          )
        ],
      ),
      margin: const EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 40.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.grey[400],
            offset: Offset(1.0, 6.0),
            blurRadius: 20.0,
            //spreadRadius: 10,
          ),
        ],
        color: Colors.white,
      ),
    ),
  );
}

Widget _servicesCards4(BuildContext context) {
  return GestureDetector(
      onTap: () {   
         Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SearchList()));
      },
      child: Container(
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/img/doctor.png',
              height: 60,
              width: 60,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Your Live\n Doctor',
              style: TextStyle(fontFamily: 'Poppins', color: Colors.blue),
              textAlign: TextAlign.center,
            )
          ],
        ),
        margin: const EdgeInsets.all(8),
        padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 40.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey[400],
              offset: Offset(1.0, 6.0),
              blurRadius: 20.0,
              //spreadRadius: 10,
            ),
          ],
          color: Colors.white,
        ),
      ));
}

// Widget _bottomNavigation(BuildContext context) {
//   return
// }

// class GradientAppBar extends StatelessWidget {
//   final String title;
//   final double barHeight = 66.0;

//   GradientAppBar(this.title);

//   @override
//   Widget build(BuildContext context) {
//     final double statusBarHeight = MediaQuery.of(context).padding.top;

//     return new Container(
//       padding: new EdgeInsets.only(top: statusBarHeight),
//       height: statusBarHeight + barHeight,
//       child: new Center(
//         child: new Text(
//           title,
//           style: const TextStyle(
//               color: Colors.white,
//               fontFamily: 'Poppins',
//               fontWeight: FontWeight.w600,
//               fontSize: 36.0),
//         ),
//       ),
//       decoration: new BoxDecoration(
//         gradient: new LinearGradient(
//             colors: [const Color(0xFF3366FF), const Color(0xFF00CCFF)],
//             begin: const FractionalOffset(0.0, 0.0),
//             end: const FractionalOffset(1.0, 0.0),
//             stops: [0.0, 1.0],
//             tileMode: TileMode.clamp),
//       ),
//     );
//   }
// }

// gradient: new LinearGradient(
//     colors: [const Color(0xFF3366FF), const Color(0xFF00CCFF)],
//     begin: const FractionalOffset(0.0, 0.0),
//     end: const FractionalOffset(1.0, 0.0),
//     stops: [0.0, 1.0],
//     tileMode: TileMode.clamp),

// border: new Border.all(width: 1.0, color: Colors.black),
