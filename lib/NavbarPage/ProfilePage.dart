import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = 'Username';
  String email = 'email@example.com';
  String location = 'Jakarta';
  String phoneNumber = '0822-1234-3412';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.red.shade600,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Stack(
              alignment: Alignment.bottomRight,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("image/account.png"),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              username,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              email,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _showEditDialog(context);
              },
              child: const Text('Edit Profil'),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: const Icon(Icons.location_on),
              title: Text(location),
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: Text(phoneNumber),
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context) {
    TextEditingController usernameController = TextEditingController(text: username);
    TextEditingController emailController = TextEditingController(text: email);
    TextEditingController locationController = TextEditingController(text: location);
    TextEditingController phoneNumberController = TextEditingController(text: phoneNumber);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Profile'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(labelText: 'Username'),
              ),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: locationController,
                decoration: const InputDecoration(labelText: 'Location'),
              ),
              TextField(
                controller: phoneNumberController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  username = usernameController.text;
                  email = emailController.text;
                  location = locationController.text;
                  phoneNumber = phoneNumberController.text;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSkillWidget(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Icon(icon, size: 40, color: Colors.blue),
          const SizedBox(height: 4),
          Text(label, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
