// ignore_for_file: non_constant_identifier_names

class PhoneDetailEntity {
  final String id;
  final String title;
  final String camera;
  final List<String> capacity;
  final List<String> color;
  final String CPU;
  final List<String> images;
  final bool isFavorites;
  final int price;
  final double rating;
  final String sd;
  final String ssd;

  PhoneDetailEntity(
      this.id,
      this.title,
      this.camera,
      this.capacity,
      this.color,
      this.CPU,
      this.images,
      this.isFavorites,
      this.price,
      this.rating,
      this.sd,
      this.ssd);
}
