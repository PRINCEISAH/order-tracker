class Order {
  final String orderId;
  final DateTime orderDateTime;
  final String item;
  final int quantity;
  final int price;
  final String image;
  final String orderType;

  Order(
      {required this.orderId,
      required this.orderDateTime,
      required this.item,
      required this.price,
      required this.image,
      required this.quantity,
      required this.orderType});
}

final Order mockOrder = Order(
    orderId: "154323",
    orderDateTime: DateTime.now(),
    item: "Fraise Cream",
    price: 1200,
    quantity: 5,
    orderType: "Instant",
    image: 'assets/images/food1.png');
