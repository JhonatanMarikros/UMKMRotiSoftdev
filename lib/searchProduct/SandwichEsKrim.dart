import 'package:softdevuas/searchProduct/searchpage.dart';

class SandwichEsKrim extends Item {
  SandwichEsKrim (String name, String imagePath, double price)
      : super(
          name,
          imagePath,
          price,
          description: 'Sandwich Es krim terdiri es krim ditengah-tengah dan dilapisi roti.',
          variasi: ['Sandwich Es Krim Oreo', 'Sandwich Es Krim Matcha', 'Sandwich Es Krim Karamel'],
        );
}