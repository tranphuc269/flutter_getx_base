class ProductData {
  ProductData({
    required this.productId,
    required this.producerName,
    required this.producerId,
    required this.description,
    required this.price,
    required this.images,
    required this.availableItemCount,
    required this.averageRating,
    required this.categoryId,
    required this.categoryName,
    required this.noOfRatings,
    required this.productName,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      productId: json['productId'],
      producerName: json['producerName'],
      producerId: json['producerId'],
      description: json['description'],
      price: json['price'],
      images: (json['images'] as List).map((e) => e.toString()).toList(),
      availableItemCount: json['availableItemCount'],
      averageRating: json['averageRating'],
      categoryId: json['categoryId'],
      categoryName: json['categoryName'],
      noOfRatings: json['noOfRatings'],
      productName: json['productName'],
    );
  }

  String productId;
  String productName;
  String description;
  double price;
  String categoryName;
  String categoryId;
  String producerId;
  String producerName;
  int availableItemCount;
  double averageRating;
  int noOfRatings;
  List<String> images;
}