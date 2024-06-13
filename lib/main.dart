import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:softdevuas/NavbarPage/account.dart';
import 'package:softdevuas/NavbarPage/cart.dart';
import 'package:softdevuas/NavbarPage/home.dart';
import 'package:softdevuas/NavbarPage/likes.dart';
import 'package:softdevuas/Register_login/auth_service.dart';
import 'package:softdevuas/Register_login/login_screen.dart';
import 'package:softdevuas/searchProduct/searchpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Cart()),
        ChangeNotifierProvider(create: (context) => Likes()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int currentPages = 0;

  final List<Widget> pages = [
    const Home(),
    LikesPage(),
    CartPage(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('UMKM Roti'),
        backgroundColor: Colors.red.shade600,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              await AuthService().signout();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: IndexedStack(
          index: currentPages,
          children: pages,
        ),
      ),
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red.shade600,
        boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.white.withOpacity(.1)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: GNav(
          gap: 8,
          backgroundColor: Colors.red.shade600,
          color: Colors.white,
          activeColor: Colors.white,
          iconSize: 24,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          duration: const Duration(milliseconds: 800),
          tabBackgroundColor: Colors.red.shade400,
          tabs: [
            GButton(
              icon: Icons.home,
              text: 'Home',
            ),
            GButton(
              icon: Icons.favorite,
              text: 'Likes',
            ),
            GButton(
              icon: Icons.shopping_cart,
              text: 'Cart',
            ),
            GButton(
              icon: Icons.account_box,
              text: 'Account',
            ),
          ],
          selectedIndex: currentPages,
          onTabChange: (index) {
            setState(() {
              currentPages = index;
            });
          },
        ),
      ),
    );
  }
}
