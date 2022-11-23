// ignore_for_file: non_constant_identifier_names, file_names

abstract class PhoneEntity {
  List<PhoneHomeStoreEntity>? homeStore;
  List<PhoneBestSellerEntity>? bestSeller;

  PhoneEntity(this.homeStore, this.bestSeller);
}

class PhoneHomeStoreEntity {
  final int id;
  final String title;
  final String picture;
  final String subtitle;
  final bool is_buy;
  final bool is_new;

  const PhoneHomeStoreEntity({
    required this.id,
    required this.title,
    required this.picture,
    required this.subtitle,
    required this.is_buy,
    this.is_new = false,
  });
}

class PhoneBestSellerEntity {
  final int id;
  final String title;
  final String picture;
  final bool is_favorites;
  final int price_without_discount;
  final int discount_price;

  const PhoneBestSellerEntity({
    required this.id,
    required this.title,
    required this.picture,
    required this.is_favorites,
    required this.price_without_discount,
    required this.discount_price,
  });
}
