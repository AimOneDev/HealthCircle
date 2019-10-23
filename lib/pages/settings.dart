import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SettingsPageState();
  }
}

class _SettingsPageState extends State<SettingsPage> {
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

  Widget _appBarBuild() {
  return AppBar(
    iconTheme: IconThemeData(color: Colors.blue),
    title: Text(
      'Settings',
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

bool value = true;
bool value1 = true;
bool value2 = false;
Widget _listviewBuild() {
  return ListView(
    children: <Widget>[
      ListTile(
        title: Text('Allow Notifications', style: TextStyle(fontSize: 16, color: Colors.grey, fontFamily: 'Poppins'),),
        trailing: Checkbox(
          value: value,
          onChanged: (bool newValue) {
            setState(() {
              value = newValue;
            });
          },
          activeColor: Colors.blue,
        ),
      ),
      Divider(),
      SwitchListTile(
          title: Text('Keep Leading', style: TextStyle(fontSize: 16, color: Colors.grey, fontFamily: 'Poppins'),), 
          value: value2,
          onChanged: (bool newValue) {
            setState(() {
              value2 = newValue;
            });
          },
          activeColor: Colors.blue,
        ),
      
      Divider(),
     SwitchListTile(
          title: Text('Disactivate auto complation', style: TextStyle(fontSize: 16, color: Colors.grey, fontFamily: 'Poppins'),), 
          value: value1,
          onChanged: (bool newValue) {
            setState(() {
              value1 = newValue;
            });
          },
          activeColor: Colors.blue,
        ),
      Divider(),
     ListTile(
        title: Text('Keep Profile Private', style: TextStyle(fontSize: 16, color: Colors.grey, fontFamily: 'Poppins'),),
        trailing: Icon(Icons.info)
      ),
      Divider(),
      ListTile(
        title: Text('CheckBox Info', style: TextStyle(fontSize: 16, color: Colors.grey, fontFamily: 'Poppins'),),
      ),
      Divider()
    ],
  );
}

}

