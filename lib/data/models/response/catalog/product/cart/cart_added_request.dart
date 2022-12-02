class CartAddedRequest {
  CartAddedRequest({required this.productId, required this.quantity});

  Map<String, dynamic> toJson() {
    return {'productId': productId, 'quantity': quantity};
  }

  String productId;
  int quantity;
}
