import 'package:coffee_shop/utils/coffee_tile.dart';
import 'package:coffee_shop/utils/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeeTypes = [
    ['Cappuccino', false],
    ['Latte', false],
    ['Milk', false],
    ['Americano', false],
    ['Expresso', false],
  ];
  coffeeTypeSelected(int value) {
    setState(() {
      for (var i = 0; i < coffeeTypes.length; i++) {
        coffeeTypes[i][1] = false;
      }
      coffeeTypes[value][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.notifications),
          label: '',
        ),
      ]),
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 22.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              'Find the best coffee for you',
              style: GoogleFonts.bebasNeue(fontSize: 56),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Find your coffee...',
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600)),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeeTypes.length,
                itemBuilder: (context, value) {
                  return CoffeeType(
                    coffeeType: coffeeTypes[value][0],
                    onTap: () => coffeeTypeSelected(value),
                    isSelected: coffeeTypes[value][1],
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                CoffeeTile(
                  coffeeName: 'Cappuccino',
                  coffePrice: 4.20,
                  coffeeImagePath: 'images/cappuccino.jpg',
                  coffeeSubtitle: 'Mixed with Almond',
                ),
                CoffeeTile(
                  coffePrice: 5.0,
                  coffeeImagePath: 'images/latte.jpg',
                  coffeeName: 'Latte',
                  coffeeSubtitle: 'Mixed with love',
                ),
                CoffeeTile(
                    coffePrice: 3.5,
                    coffeeImagePath: 'images/milk.jpg',
                    coffeeName: 'Milk coffee',
                    coffeeSubtitle: 'Plain milk')
              ],
            ),
          ),
        ],
      ),
    );
  }
}
