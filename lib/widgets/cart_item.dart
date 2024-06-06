import 'package:flutter/material.dart';
import '../models/coffee.dart';
import '../providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final Coffee coffee;

  CartItem(this.coffee);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Dismissible(
      key: ValueKey(coffee.id),
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        cart.removeItem(coffee.id);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(coffee.imageUrl),
            ),
            title: Text(coffee.name),
            subtitle: Text('\$${coffee.price}'),
            trailing: const Text('1x'),
          ),
        ),
      ),
    );
  }
}