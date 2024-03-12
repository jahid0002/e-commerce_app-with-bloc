class CartDetailsModel {
  final String imagePath;
  final String name;
  final String price;
  final String rating;
  final String discriprion;
  final String cetagory;
  final num stock;
  final num id;

  const CartDetailsModel(
      {required this.imagePath,
      required this.name,
      required this.price,
      required this.rating,
      required this.discriprion,
      required this.cetagory,
      required this.stock, 
      required this.id
      });
}
