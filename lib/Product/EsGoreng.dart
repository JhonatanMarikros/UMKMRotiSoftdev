import 'package:flutter/material.dart';
import 'package:softdevuas/NavbarPage/cart.dart';
import 'package:softdevuas/NavbarPage/likes.dart';
import 'package:softdevuas/searchProduct/searchpage.dart';

class Esgoreng extends StatefulWidget {
  @override
  _EsgorengState createState() => _EsgorengState();
}

class _EsgorengState extends State<Esgoreng> {
  bool isLiked = false;
  final Cart _cart = Cart();
  final Likes _likes = Likes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Esgoreng'),
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
                    image: AssetImage('image/1.png'),
                    fit: BoxFit
                        .cover, // Ensures the image covers the container area
                  ),
                  borderRadius:
                      BorderRadius.zero, // Ensures the edges are not rounded
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Es Krim Goreng',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 10),
              Text(
                'Harga: 12.000',
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
                          'Es Krim Goreng',
                          'image/1.png',
                          12.0,
                          description: 'Deskripsi',
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
                        'Es Krim Goreng',
                        'image/1.png',
                        12.0,
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
                'Es krim goreng, merupakan es krim yang dibungkus dengan lapisan adonan renyah.Perpaduan es krim dan adonan ini memunculkan sensasi makan yang unik, dengan krim yang lembut dan luaran yang renyah.',
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
                  _buildvariasiItem('- Es Krim Goreng Cokelat'),
                  _buildvariasiItem('- Es Krim Goreng Strawberry'),
                  _buildvariasiItem('- Es Krim Goreng Vanilla'),
                  _buildvariasiItem('- Es Krim Goreng Campur'),
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
