import 'package:softdevuas/searchProduct/searchpage.dart';

class MieBurger extends Item {
  MieBurger(String name, String imagePath, double price)
      : super(
          name,
          imagePath,
          price,
          description: 'Mie burger adalah kreasi unik yang menggabungkan elemen burger dengan mie sebagai pengganti roti',
          variasi: ['Mie Burger Ayam Teriyaki', 'Mie Burger BBQ'],
        );
}