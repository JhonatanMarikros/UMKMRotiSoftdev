import 'package:softdevuas/searchProduct/searchpage.dart';

class Esgoreng extends Item {
  Esgoreng(String name, String imagePath, double price)
      : super(
          name,
          imagePath,
          price,
          description: 'Es krim goreng, merupakan es krim yang dibungkus dengan lapisan adonan renyah.Perpaduan es krim dan adonan ini memunculkan sensasi makan yang unik, dengan krim yang lembut dan luaran yang renyah.',
          variasi: ['Es Krim Goreng Cokelat', 'Es Krim Goreng Strawberry', 'Es Krim Goreng Vanilla', 'Es Krim Goreng Campur'],
        );
}