import 'package:flutter/material.dart';

class PersonalInfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PersonalInfoPageState();
  }
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
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

  final mainCard = new Container(
    alignment: FractionalOffset.center,
    child: cardContent,
    //width: 350,
    height: 400.0,
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

  static final cardContent = new Container(
    margin: EdgeInsets.fromLTRB(16.0, 42.0, 16.0, 16),
    // constraints: new BoxConstraints.expand(),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.end,
      // mainAxisSize: MainAxisSize.max,
      // verticalDirection: VerticalDirection.down,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.supervised_user_circle,
              color: Colors.white,
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              'Personal Info',
              style: TextStyle(
                  fontSize: 22, color: Colors.white, fontFamily: 'Poppins'),
            )
          ],
        ),
        //SizedBox(height: 8.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Name :',
              style: TextStyle(
                  fontSize: 22, color: Colors.white, fontFamily: 'Poppins'),
            ),
            SizedBox(
              width: 16.0,
            ),
            Text(
              'Aymen Hajab',
              style: TextStyle(
                  fontSize: 17, color: Colors.white, fontFamily: 'Poppins'),
            )
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Phone :',
              style: TextStyle(
                  fontSize: 22, color: Colors.white, fontFamily: 'Poppins'),
            ),
            SizedBox(
              width: 16.0,
            ),
            Text(
              '+213 662555262',
              style: TextStyle(
                  fontSize: 17, color: Colors.white, fontFamily: 'Poppins'),
            )
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Adresse :',
              style: TextStyle(
                  fontSize: 22, color: Colors.white, fontFamily: 'Poppins'),
            ),
            SizedBox(
              width: 16.0,
            ),
            Text(
              'Cite 200 logts',
              style: TextStyle(
                  fontSize: 17, color: Colors.white, fontFamily: 'Poppins'),
            )
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Age :',
              style: TextStyle(
                  fontSize: 22, color: Colors.white, fontFamily: 'Poppins'),
            ),
            SizedBox(
              width: 16.0,
            ),
            Text(
              '24',
              style: TextStyle(
                  fontSize: 17, color: Colors.white, fontFamily: 'Poppins'),
            )
          ],
        ),
        // SizedBox(height: 8.0,),
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
            child: mainCard,
          ),
          Hero(tag: 'id3', child: cardThumbnail),
        ],
      ),
    );
  }
}
