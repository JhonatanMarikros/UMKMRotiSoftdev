import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Color.fromARGB(255, 150,75,0),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const <Widget>[
          NotificationItem(
            productImage: 'image/7.png',
            message: 'Mie Kebab',
            timestamp: '2 Jam lalu',
          ),
          SizedBox(height: 16),
          NotificationItem(
            productImage: 'image/3.png',
            message: 'Sandwich Mie',
            timestamp: '3 Jam lalu',
          ),
          SizedBox(height: 16),
          NotificationItem(
            productImage: 'image/1.png',
            message: 'Es Krim Goreng',
            timestamp: '1 Hari lalu',
          ),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String productImage;
  final String message;
  final String timestamp;

  const NotificationItem({
    required this.productImage,
    required this.message,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(productImage),
        ),
        title: Text(message),
        subtitle: Text(timestamp),
        onTap: () {},
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: NotificationsPage(),
  ));
}
