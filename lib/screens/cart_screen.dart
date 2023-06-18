import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem(
      id: 1,
      name: 'Product 1',
      price: 50,
      quantity: 1,
    ),
    CartItem(
      id: 2,
      name: 'Product 2',
      price: 200,
      quantity: 3,
    ),
    CartItem(
      id: 3,
      name: 'Product 3',
      price: 100,
      quantity: 2,
    ),
  ];

  void increaseQuantity(CartItem cartItem) {
    setState(() {
      cartItem.quantity++;
    });
  }

  void decreaseQuantity(CartItem cartItem) {
    setState(() {
      if (cartItem.quantity > 1) {
        cartItem.quantity--;
      }
    });
  }

  void removeItem(CartItem cartItem) {
    setState(() {
      cartItems.remove(cartItem);
    });
  }

  double getTotalPrice() {
    double total = 0;
    for (var cartItem in cartItems) {
      total += cartItem.price * cartItem.quantity;
    }
    return total;
  }

  void pay() {
    // Logic for payment
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Payment Successful'),
          content: const Text('Thank you for your purchase!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  cartItems.clear();
                });
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Cart',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartItems[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                color: const Color(0xFFF3F6FD),
                intensity: 1,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: ListTile(
                  leading: Image.asset("assets/images/Product ${index + 1}.png"),
                  title: Text(cartItem.name),
                  subtitle: Text('\$${cartItem.price}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => decreaseQuantity(cartItem),
                        icon: const Icon(Icons.remove),
                      ),
                      Text('${cartItem.quantity}'),
                      IconButton(
                        onPressed: () => increaseQuantity(cartItem),
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                  onTap: () => removeItem(cartItem),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total: \$${getTotalPrice()}',
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: cartItems.isEmpty ? null : pay,
                child: const Text('Pay'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CartItem {
  final int id;
  final String name;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });
}