import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {
  CoffeeType({
    Key? key,
    required this.coffeeType,
    required this.onTap,
    required this.isSelected,
  }) : super(key: key);
  final String coffeeType;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          coffeeType,
          style: TextStyle(
            fontSize: 20,
            color: isSelected ? Colors.orange : Colors.white,
          ),
        ),
      ),
    );
  }
}
