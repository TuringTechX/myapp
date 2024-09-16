import '../models/MarketplaceModel.dart';

class MarketplaceRepository {
  Future<List<MarketplaceModel>> getMarketplaceItems() async {
    // Simulate API call
    await Future.delayed(Duration(seconds: 2));

    return [
      MarketplaceModel(
        itemId: "1001",
        title: "Solar Panel Set",
        description: "High-efficiency solar panels for home use.",
        price: 500.00,
        category: "Renewable Energy",
        isAvailable: true,
      ),
    ];
  }

  Future<void> purchaseItem(String itemId) async {
    // Simulate API call for purchasing an item
    await Future.delayed(Duration(seconds: 1));
  }
}
