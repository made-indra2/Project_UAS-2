import 'package:flutter/material.dart';
import 'package:project_uas/Data.dart';
import 'package:qr_flutter/qr_flutter.dart';

class EntryForm extends StatefulWidget {
  final Contact contact;
  List<Contact> contactList;

  EntryForm(this.contact);

  @override
  EntryFormState createState() => EntryFormState(this.contact);
}
//class controller
class EntryFormState extends State<EntryForm> {
  Contact contact;

  EntryFormState(this.contact);

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //kondisi
    if (contact != null) {
      nameController.text = contact.name;
      phoneController.text = contact.phone;
    }
    //rubah
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(121, 0, 255, 0.7),
          title: contact == null ? Text('Input Data') : Text('Ubah Data'),
          leading: Icon(Icons.keyboard_arrow_left),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left:10.0, right:10.0),
          child: ListView(
            children: <Widget> [
              Image.asset("assets/InputData.png"
                , width: 250,),
              SizedBox(
                height: 40.0,
              ),
              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              // telepon
              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'NIK',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Umur',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Asal',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              // tombol button
              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: Row(
                  children: <Widget> [
                    // tombol simpan
                    Expanded(
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        color: Color.fromRGBO(121, 0, 255, 0.7),
                        textColor: Colors.white,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          if (contact == null) {
                            // tambah data
                            contact = Contact(nameController.text, phoneController.text);
                          } else {
                            // ubah data
                            contact.name = nameController.text;
                            contact.phone = phoneController.text;
                          }
                          // kembali ke layar sebelumnya dengan membawa objek contact
                          Navigator.pop(context, contact);
                        },
                      ),
                    ),
                    Container(width: 5.0,),
                    // tombol batal
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}

/*
class InputUser extends StatefulWidget {
  InputUser(Contact contact);

  @override
  State<StatefulWidget> createState() => InputUserState();
}

class InputUserState extends State<InputUser> {

  TextEditingController controllernik =  TextEditingController();
  TextEditingController controllerasal =  TextEditingController();
  String qrData = "https://github.com/agusberlian";
  int umur;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(121, 0, 255, 0.7),
        title: Text('Input Data'),
        centerTitle: true,
        actions: <Widget>[],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/InputData.png"
              , width: 250,),
            SizedBox(
              height: 40.0,
            ),
            Text(
              "Masukkan Nama Dengan Benar",
              style: TextStyle(fontSize: 20.0),
            ),
            TextField(
              controller: qrdataFeed,
              decoration: InputDecoration(
                hintText: "Nama",
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            TextField(
              controller: controllernik,
              decoration: InputDecoration(
                hintText: "Nik",
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            TextField(
              decoration: InputDecoration(
                hintText: "Umur",
              ),
              onChanged: (txt) {
                setState(() {
                  umur = int.parse(txt);
                });
              },
            ),
            SizedBox(
              height: 40.0,
            ),
            TextField(
              controller: controllerasal,
              decoration: InputDecoration(
                hintText: "Asal",
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
              child: RaisedButton(
                padding: EdgeInsets.all(15.0),
                onPressed: () async {

                  if (qrdataFeed.text.isEmpty) {        //a little validation for the textfield
                    setState(() {
                      qrData = "";
                    });
                  } else {
                    setState(() {
                      qrData = qrdataFeed.text;
                    });
                  }
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => resultuser(qrcode: qrData, nik: controllernik.text, asal: controllerasal.text, old: umur)));
                },
                child: Text(
                  "Generate QRCode",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                color: Color.fromRGBO(121, 0, 255, 0.7),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
            )
          ],
        ),
      ),
    );
  }

  final qrdataFeed = TextEditingController();
}
*/