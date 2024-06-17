import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:softdevuas/NavbarPage/Aboutus.dart';
import 'package:softdevuas/NavbarPage/FeedbackPage.dart';
import 'package:softdevuas/NavbarPage/NotifcationPage.dart';
import 'package:softdevuas/NavbarPage/ProfilePage.dart';
import 'package:softdevuas/NavbarPage/Progress.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _showPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text('Gallery'),
                  onTap: () {
                    _pickImage(ImageSource.gallery);
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _pickImage(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            alignment: const Alignment(1, 1),
            width: MediaQuery.of(context).size.width,
            height: 190,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: _image == null
                    ? const AssetImage("image/account.png")
                    : FileImage(_image!) as ImageProvider,
              ),
            ),
            child: GestureDetector(
              onTap: () => _showPicker(context),
              child: Container(
                margin: const EdgeInsets.only(right: 10, bottom: 10),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(60),
                ),
                padding: const EdgeInsets.all(10.0),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(bottom: 0),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  border: Border(
                      bottom: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1.0,
                  )),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.edit,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 28,
                    ),
                    title: const Text('Profile',
                        style: TextStyle(color: Colors.black, fontSize: 17)),
                    trailing: Icon(Icons.keyboard_arrow_right,
                        color: Theme.of(context).colorScheme.secondary),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ProfilePage()),
                      );
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.notifications,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 28,
                    ),
                    title: const Text('Notifications',
                        style: TextStyle(color: Colors.black, fontSize: 17)),
                    trailing: Icon(Icons.keyboard_arrow_right,
                        color: Theme.of(context).colorScheme.secondary),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NotificationsPage()),
                      );
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.panorama,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 28,
                    ),
                    title: const Text('Progress',
                        style: TextStyle(color: Colors.black, fontSize: 17)),
                    trailing: Icon(Icons.keyboard_arrow_right,
                        color: Theme.of(context).colorScheme.secondary),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Progress()),
                      );
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.feedback,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 28,
                    ),
                    title: const Text('Feedback',
                        style: TextStyle(color: Colors.black, fontSize: 17)),
                    trailing: Icon(Icons.keyboard_arrow_right,
                        color: Theme.of(context).colorScheme.secondary),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FeedbackPage()),
                      );
                    },
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.add_photo_alternate,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 28,
                    ),
                    title: const Text('About Us',
                        style: TextStyle(color: Colors.black, fontSize: 17)),
                    trailing: Icon(Icons.keyboard_arrow_right,
                        color: Theme.of(context).colorScheme.secondary),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AboutUs()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
