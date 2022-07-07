import 'package:flutter/material.dart';

class CoffeeTile extends StatelessWidget {
  const CoffeeTile({
    Key? key,
    required this.coffePrice,
    required this.coffeeImagePath,
    required this.coffeeName,
    required this.coffeeSubtitle,
  }) : super(key: key);
  final String coffeeImagePath;
  final double coffePrice;
  final String coffeeName;
  final String coffeeSubtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, bottom: 10),
      child: Container(
        padding: EdgeInsets.all(8.0),
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 150,
                width: 200,
                child: Image.asset(
                  coffeeImagePath,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              coffeeName,
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              coffeeSubtitle,
              style: TextStyle(
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '\$$coffePrice',
                  ),
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(7)),
                    child: const Icon(
                      Icons.add,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
