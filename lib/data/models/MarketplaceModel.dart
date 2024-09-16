class MarketplaceModel {
  final String itemId;
  final String title;
  final String description;
  final double price;
  final String category; // e.g. renewable energy, carbon offset
  final bool isAvailable;

  MarketplaceModel({
    required this.itemId,
    required this.title,
    required this.description,
    required this.price,
    required this.category,
    required this.isAvailable,
  });
}
