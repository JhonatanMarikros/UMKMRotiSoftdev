import 'package:flutter/material.dart';
import 'package:softdevuas/NavbarPage/cart.dart';
import 'package:softdevuas/NavbarPage/likes.dart';
import 'package:softdevuas/searchProduct/searchpage.dart';

class SandwichSalmon extends StatefulWidget {
  @override
  _SandwichSalmonState createState() => _SandwichSalmonState();
}

class _SandwichSalmonState extends State<SandwichSalmon> {
  bool isLiked = false;
  final Cart _cart = Cart();
  final Likes _likes = Likes();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sandwich Salmon'),
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
                    image: AssetImage('image/4.png'),
                    fit: BoxFit
                        .cover, // Ensures the image covers the container area
                  ),
                  borderRadius:
                      BorderRadius.zero, // Ensures the edges are not rounded
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Sandwich Salmon',
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 10),
              Text(
                'Harga: 30.000',
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
                          'Sandwich Salmon',
                          'image/4.png',
                          30.0,
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
                        'Sandwich Salmon',
                        'image/4.png',
                        30.0,
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
                'Sandwich ini dibuat dengan menggunakan roti gandum atau roti ciabatta yang diisi dengan fillet salmon panggang atau asap.',
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
                  _buildvariasiItem('- Sandwich Salmon Avokad'),
                  _buildvariasiItem('- Sandwich Salmon Cream Cheese'),
                  _buildvariasiItem('- Sandwich Salmon Pedas'),
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
