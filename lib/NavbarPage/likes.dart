import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:softdevuas/searchProduct/searchpage.dart';

class Likes extends ChangeNotifier {
  static final Likes _instance = Likes._internal();
  factory Likes() => _instance;

  Likes._internal();

  final List<Item> _likedItems = [];

  List<Item> get likedItems => List.unmodifiable(_likedItems);

  void toggleLike(Item item) {
    if (_likedItems.contains(item)) {
      _likedItems.remove(item);
    } else {
      _likedItems.add(item);
    }
    notifyListeners(); // Notify all listeners about change.
  }
}

class LikesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<Likes>(
        builder: (context, likes, child) {
          return likes.likedItems.isEmpty
              ? Center(child: Text('No items liked yet'))
              : ListView.builder(
                  itemCount: likes.likedItems.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 11.0, vertical: 8.0),
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage(likes.likedItems[index].imagePath),
                        radius: 30,
                      ),
                      title: Text(likes.likedItems[index].name),
                      trailing: IconButton(
                        icon: Icon(
                          likes.likedItems.contains(likes.likedItems[index])
                              ? Icons.delete
                              : Icons.delete_forever,
                        ),
                        onPressed: () {
                          likes.toggleLike(likes.likedItems[index]);
                        },
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Item likedItem;
  final VoidCallback onRemove;

  DetailPage({required this.likedItem, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    final priceFormat = NumberFormat('#,###.000', 'en_US');
    final formattedPrice = priceFormat.format(likedItem.price);

    //Membagi harga yang diformat menjadi bagian bilangan bulat dan desimal
    final parts = formattedPrice.split('.');
    final integerPart = parts[0];
    final decimalPart = parts.length > 1 ? parts[1] : '';

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Hero(
                  tag: 'hero-tag-${likedItem.name}',
                  child: CircleAvatar(
                    backgroundImage: AssetImage(likedItem.imagePath),
                    radius: 80,
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      likedItem.name,
                      style: const TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Harga: $integerPart.$decimalPart',
                      style: const TextStyle(fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description:',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      likedItem.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Features:',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    for (var feature in likedItem.variasi)
                      Text(
                        '- $feature',
                        style: const TextStyle(fontSize: 16),
                      ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    //Navigasi kembali ke halaman sebelumnya
                    Navigator.pop(context);
                  },
                  child: Text('Back'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
