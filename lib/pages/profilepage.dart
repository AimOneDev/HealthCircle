import 'package:flutter/material.dart';

import './vitalinfo.dart';
import 'personalinfo.dart';
import './settings.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarBuild(),
      backgroundColor: Color(0xFFF5F5F5),
      body: Container(
        child: ListView(
          children: <Widget>[
            CardRow(),
            //SizedBox(height: 5.0,),
            _buildOptionsList(context),
          ],
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
      'My Profile',
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

// class HomePageBody extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return  CardRow();
//   }
// }

class CardRow extends StatelessWidget {
  final cardThumbnail = new Container(
    //  margin: new EdgeInsets.symmetric(
    //    vertical: 16.0
    //  ),
    alignment: FractionalOffset.center,
    child: CircleAvatar(
      backgroundImage: AssetImage(
        'assets/img/profile.jpg',
      ),
      radius: 32,
    ),
  );

  mainCard(BuildContext context) => new Container(
        alignment: FractionalOffset.center,
        child: cardContent(context),
        //width: 350,
        height: 154.0,
        margin: new EdgeInsets.only(top: 30.0),
        decoration: new BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(33.0),
          boxShadow: <BoxShadow>[
            new BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: new Offset(0.0, 10.0),
            ),
          ],
        ),
      );

  cardContent(BuildContext context) => new Container(
        margin: EdgeInsets.fromLTRB(16.0, 42.0, 16.0, 0),
        // constraints: new BoxConstraints.expand(),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Aymen Hajab',
              style: TextStyle(
                  fontSize: 22, color: Colors.white, fontFamily: 'Poppins'),
            ),
            //SizedBox(height: 8.0,),
            Text(
              '+1 256 1589',
              style: TextStyle(
                  fontSize: 17, color: Colors.white, fontFamily: 'Poppins'),
            ),
            // SizedBox(height: 8.0,),
            flatButtonForInfo(context),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return new Container(
        margin: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[
            Hero(
                transitionOnUserGestures: true,
                tag: 'id2',
                child: mainCard(context)),
            Hero(tag: 'id3', child: cardThumbnail),
          ],
        ));
  }
}

Widget _buildOptionsList(BuildContext context) {
  return Container(
    child: _buildOptionsListContent(context),
    margin: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 24.0,
    ),
    //constraints: BoxConstraints.expand(),
    alignment: FractionalOffset.center,
    //child: cardContent,
    //width: 350,
    height: 240.0,
    decoration: new BoxDecoration(
      color: Colors.white,
      shape: BoxShape.rectangle,
      borderRadius: new BorderRadius.circular(33.0),
      boxShadow: <BoxShadow>[
        new BoxShadow(
          color: Colors.black12,
          blurRadius: 10.0,
          offset: new Offset(0.0, 10.0),
        ),
      ],
    ),
  );
}

Widget _buildOptionsListContent(BuildContext context) {
  return Column(
    children: <Widget>[
      ListTile(
        trailing: Icon(Icons.arrow_right),
        leading: Icon(Icons.insert_emoticon),
        title: Text(
          'Personal Informations',
          style: TextStyle(
              fontSize: 16, color: Colors.grey, fontFamily: 'Poppins'),
        ),
        onTap: () {
           Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    PersonalInfoPage()),
          );
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
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => VitalInfoPage(),));
        },
      ),
      ListTile(
        trailing: Icon(Icons.arrow_right),
        leading: Icon(Icons.file_upload),
        title: Text(
          'Additional Files',
          style: TextStyle(
              fontSize: 16, color: Colors.grey, fontFamily: 'Poppins'),
        ),
        onTap: () {
          Navigator.pushNamed(context, '/');
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
    ],
  );
}

Widget flatButtonForInfo(BuildContext context) {
  return FlatButton(
    padding: EdgeInsets.all(0),
    child: Text(
      'Personal Info',
      style:
          TextStyle(fontSize: 12, color: Colors.white, fontFamily: 'Poppins'),
    ),
    onPressed: () {
      return Navigator.push(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => PersonalInfoPage()));
    },
  );
}

// Padding(
//     padding: EdgeInsets.symmetric(vertical: 1.0,horizontal: 5.0),
//     child: Material(
//       // borderRadius:
//       //     BorderRadius.circular(30.0), //Set this up for rounding corners.
//      // shadowColor: Colors.lightBlueAccent.shade100,
//       child: FlatButton(
//         child: Text(
//           'SUBMIT',
//           style: TextStyle(
//               fontFamily: 'Poppins',
//               color: Colors.white,
//               fontSize: 12,
//               fontWeight: FontWeight.normal),
//         ),
//         //textColor: Colors.white,
//        // color: Colors.blue,
//         // shape: new RoundedRectangleBorder(
//         //     borderRadius: new BorderRadius.circular(30.0)),
//         //padding: EdgeInsets.symmetric(vertical: 5.0),
//         //animationDuration: Duration(seconds: 1),
//         //materialTapTargetSize: MaterialTapTargetSize.padded,
//         onPressed: () {},
//       ),
//     ),
//   );
