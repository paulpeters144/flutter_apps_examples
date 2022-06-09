import 'package:flutter/material.dart';
import 'package:food_app/modals/restaurant.dart';

class RestaurantScreen extends StatefulWidget {
  final Restaurant restaurant;
  const RestaurantScreen({Key? key, required this.restaurant})
      : super(key: key);

  @override
  State<RestaurantScreen> createState() => _RestaurantScreen();
}

class _RestaurantScreen extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image(
                height: 220.0,
                width: MediaQuery.of(context).size.width,
                image: AssetImage(widget.restaurant.imageUrl),
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                      iconSize: 35.0,
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite),
                      color: Theme.of(context).primaryColor,
                      iconSize: 35.0,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
