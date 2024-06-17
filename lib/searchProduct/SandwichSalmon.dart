import 'package:softdevuas/searchProduct/searchpage.dart';

class SandwichSalmon extends Item {
  SandwichSalmon(String name, String imagePath, double price)
      : super(
          name,
          imagePath,
          price,
          description: 'Sandwich ini dibuat dengan menggunakan roti gandum atau roti ciabatta yang diisi dengan fillet salmon panggang atau asap.',
          variasi: ['Sandwich Salmon Avokad', 'Sandwich Salmon Cream Cheese', 'Sandwich Salmon Pedas'],
        );
}
