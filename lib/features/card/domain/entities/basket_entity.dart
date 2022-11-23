class BasketEntity {
  final String id;
  final String delivery;
  final int total;
  final List<BasketItemsEntity> basket;

  BasketEntity(this.id, this.delivery, this.total, this.basket);
}

class BasketItemsEntity {
  final int id;
  final String title;
  final String images;
  final int price;

  BasketItemsEntity(this.id, this.title, this.images, this.price);
}
