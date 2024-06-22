import 'package:flutter/material.dart';
import 'package:softdevuas/NavbarPage/cart.dart';
import 'package:softdevuas/NavbarPage/likes.dart';
import 'package:softdevuas/searchProduct/searchpage.dart';

class SandwichMie extends StatefulWidget {
  @override
  _SandwichMieState createState() => _SandwichMieState();
}

class _SandwichMieState extends State<SandwichMie> {
  bool isLiked = false;
  final Cart _cart = Cart();
  final Likes _likes = Likes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produk'),
        backgroundColor: Color.fromARGB(255, 150,75,0),
        foregroundColor: Color.fromARGB(255, 255, 255, 255),
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
                    image: AssetImage('image/3.png'),
                    fit: BoxFit
                        .cover, // Ensures the image covers the container area
                  ),
                  borderRadius:
                      BorderRadius.zero, // Ensures the edges are not rounded
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Sandwich Mie',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 10),
              Text(
                'Harga: 15.000',
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
                          'Sandwich Mie',
                          'image/3.png',
                          15.0,
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
                          MaterialStateProperty.all<Color>(Color.fromARGB(255, 150,75,0)),
                          foregroundColor: 
                          MaterialStateProperty.all<Color>(Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                  const SizedBox(width: 10),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                      _likes.toggleLike(Item(
                        'Sandwich Mie',
                        'image/3.png',
                        15.0,
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
                    color: Color.fromARGB(255, 150,75,0),
                  ),
                ],
              ),
              // Deskripsi dan Variasi
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
                'Sandwich mie adalah hidangan yang menggabungkan mie dan roti sandwich. Biasanya, mie yang sudah dimasak dimasukkan ke dalam roti sandwich bersama dengan berbagai bahan tambahan seperti sayuran, daging, keju, dan saus.',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
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
                  _buildvariasiItem('- Sayur sayuran + Mayonaise'),
                  _buildvariasiItem('- Keju + Daging'),
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
