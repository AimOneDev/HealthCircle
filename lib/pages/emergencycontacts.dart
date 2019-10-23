import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import './addemergencycontact.dart';
import '../models/contacts.dart';

class EmergencyContactsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EmergencyContactsPageState();
  }
}

class _EmergencyContactsPageState extends State<EmergencyContactsPage> {
  List<Contacts> _contacts = [];

  @override
  initState() {
    _fetchEmeContacts();
    super.initState();
  }

  void _addEmeContact(String name, String number, String adresse) {
    Map<String, dynamic> contactsData = {
      'name': name,
      'number': number,
      'adresse': adresse,
    };
    http
        .post('https://health-circles.firebaseio.com/contacts.json',
            body: json.encode(contactsData))
        .then((http.Response response) {
      final Map<String, dynamic> responseData = json.decode(response.body);
       final Contacts cont = Contacts(
        id: responseData['name'],
        name: name,
        number: number,
        adresse: adresse,
      );

      setState(() {
        _contacts.add(cont);
      });
      print(_contacts);
    });
  }

  _fetchEmeContacts() {
  http.get('https://health-circles.firebaseio.com/contacts.json').then(
      (http.Response response) {
        //print(json.decode(response.body));
        final List<Contacts> fetchedEmeContactsList = [];
        Map<String, dynamic> emeContactsListData =
            json.decode(response.body);

            emeContactsListData.forEach((String emeContID, dynamic emeContData) {
          final Contacts medRec = Contacts(
            id: emeContID,
            name: emeContData['name'],
            number: emeContData['number'],
            adresse: emeContData['adresse'],
          );
            fetchedEmeContactsList.add(medRec);
        });
        setState(() {
           _contacts = fetchedEmeContactsList;
        });
      });
  }
  

  _buildContactsList() {
    Widget contactsCard;
    if (_contacts.length > 0) {
      contactsCard = ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            ContactsCard(_contacts[index], index),
        itemCount: _contacts.length,
      );
    } else {
      contactsCard = Center(
        child: CircularProgressIndicator(),
      );
    }
    return contactsCard;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarBuild(),
      floatingActionButton: FloatingActionButton(
        mini: true,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    AddEmergencyContactsPage(_addEmeContact)),
          );
        },
      ),
      body: Container(
        color: Color(0xFFF5F5F5),
        child: _contactsBody(context),
      ),
    );
  }

  Widget _appBarBuild() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.blue),
      title: Text(
        'Emergency Contacts',
        style: TextStyle(
            color: Colors.blue,
            fontFamily: 'Poppins',
            fontSize: 21,
            fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: <Widget>[
        Icon(
          Icons.search,
          size: 30,
        ),
      ],
      backgroundColor: Color(0xFFF5F5F5),
      elevation: 0.0,
    );
  }

  Widget _contactsBody(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 24.0, horizontal: 24.0),
            //height: 50,
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/img/emergency.png',
                    height: 35, width: 28, alignment: Alignment.center),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'Emergency Contacts',
                  style: TextStyle(
                      fontFamily: 'Poppins', color: Colors.blue, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: _buildContactsList(),
          )
        ],
      ),
    );
  }
}

class ContactsCard extends StatelessWidget {
  final Contacts contacts;
  final int contactsIndex;

  ContactsCard(this.contacts, this.contactsIndex);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => AddEmergencyContactsPage()),);
      },
      child: Dismissible(
        key: Key('d'),
        child: Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              contacts.name,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.left,
            ),
            Text(
              contacts.number,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.left,
            ),
            Text(
              contacts.adresse,
              style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        //height: 127,
        margin: EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(33.0),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.black12,
              blurRadius: 20.0,
              offset: Offset(0.0, 0.0),
            ),
          ],
        ),
      ),) 
    );
  }
}
