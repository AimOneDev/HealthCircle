import 'package:flutter/material.dart';

class DoctorListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DoctorListPageState();
  }
}

class _DoctorListPageState extends State<DoctorListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarBuild(),
      backgroundColor: Color(0xFFF5F5F5),
      body: Container(
        child: _listviewBuild(),
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
      'Live Doctor',
      style: TextStyle(
          color: Colors.blue,
          fontFamily: 'Poppins',
          fontSize: 24,
          fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    actions: <Widget>[
      Icon(
        Icons.search,
        //color: Colors.blue,
        size: 30,
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

Widget _listviewBuild() {
  return ListView(
    children: <Widget>[
      ListTile(
        onTap: () {},
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/img/avatar.png'),
          ),
          title: Text('Doctor McCall Mohammed'),
          subtitle: Text('Dormatologist  | Msila'),
          trailing: Icon(Icons.info)),
      Divider(),
      ListTile(
        onTap: () {},
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/img/avatar.png'),
          ),
          title: Text('Doctor Ahmed Ali'),
          subtitle: Text('Dormatologist  |Alger'),
          trailing: Icon(Icons.info)),
      Divider(),
      ListTile(
        onTap: () {},
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/img/avatar.png'),
          ),
          title: Text('Doctor Amina Mohammed'),
          subtitle: Text('Dormatologist  | Tiaret'),
          trailing: Icon(Icons.info)),
      Divider(),
      ListTile(
        onTap: () {},
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/img/avatar.png'),
          ),
          title: Text('Doctor Wiam Hamad'),
          subtitle: Text('Dormatologist  | Oran'),
          trailing: Icon(Icons.info)),
      Divider()
    ],
  );
}
