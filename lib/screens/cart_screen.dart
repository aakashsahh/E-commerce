import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hamro_furniture/models/products_model.dart';

class CartScreen extends StatefulWidget {
  final List<Product> cartItems;

  const CartScreen({Key? key, required this.cartItems}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {


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
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: widget.cartItems.length,
        itemBuilder: (context, index) {
          Product product = widget.cartItems[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Neumorphic(
              style: NeumorphicStyle(
                shape: NeumorphicShape.flat,
                boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
                color: const Color(0xFFF3F6FD),
                intensity: 1,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Image.network(product.imgurl),
                  title: Text(product.name),
                  subtitle: Text('Price: \$${product.price}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (product.quantity > 1) {
                              product.quantity--;
                            } else {
                              widget.cartItems.removeAt(index);
                            }
                          });
                        },
                      ),
                      Text(product.quantity.toString()),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            product.quantity++;
                          });
                        },
                      ),
                    ],
                  ),
                  onLongPress: () {
                    removeFromCart(product);
                  },
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
                'Total Price: \$${calculateTotalPrice().toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
                onPressed: () {
                  setState(() {
                    widget.cartItems.clear();
                  });
                },
                child: const Text('Pay'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  double calculateTotalPrice() {
    double totalPrice = 0;
    for (Product product in widget.cartItems) {
      totalPrice += product.price * product.quantity;
    }
    return totalPrice;
  }

  void removeFromCart(Product product) {
    setState(() {
      widget.cartItems.remove(product);
    });
  }
}
