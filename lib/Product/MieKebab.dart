import 'package:flutter/material.dart';
import 'package:softdevuas/NavbarPage/cart.dart';
import 'package:softdevuas/NavbarPage/likes.dart';
import 'package:softdevuas/searchProduct/searchpage.dart';

class MieKebab extends StatefulWidget {
  @override
  _MieKebabState createState() => _MieKebabState();
}

class _MieKebabState extends State<MieKebab> {
  bool isLiked = false;
  final Cart _cart = Cart();
  final Likes _likes = Likes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mie Kebab'),
        backgroundColor: Colors.red.shade600,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 160.0, 
                height: 160.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('image/7.png'),
                    fit: BoxFit
                        .cover, // Ensures the image covers the container area
                  ),
                  borderRadius:
                      BorderRadius.zero, // Ensures the edges are not rounded
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Mie Kebab',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 10),
              Text(
                'Harga: 17.000',
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _cart.addItem(
                        Item(
                          'Mie Kebab',
                          'image/7.png',
                          17.0,
                          description: 'Description here',
                          variasi: ['variasi 1', 'variasi 2'],
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Added to Cart'),
                        ),
                      );
                    },
                    child: const Text('Add to Cart'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red.shade600),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                      _likes.toggleLike(Item(
                        'Mie Kebab ',
                        'image/7.png',
                        17.0,
                        description: 'Description here',
                        variasi: ['variasi 1', 'variasi 2'],
                      ));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            isLiked ? 'Added to Likes' : 'Removed from Likes',
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                    ),
                    color: Colors.red.shade600,
                  ),
                ],
              ),
              //Deskripsi
              const Align(
                alignment: Alignment(-1, 0),
                child: Text(
                  'Deskripsi',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Mie kebab adalah inovasi kuliner yang menggabungkan mie dengan elemen kebab',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),

              //Variasi
              const Align(
                alignment: Alignment(-1, 0),
                child: Text(
                  'Variasi:',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildvariasiItem('- Mie Kebab Ayam'),
                  _buildvariasiItem('- Mie Kebab Ikan'),
                  _buildvariasiItem('- Mie Kebab Tofu'),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildvariasiItem(String feature) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        const SizedBox(width: 8),
        Text(feature, style: const TextStyle(fontSize: 16)),
      ],
    ),
  );
}
