class Product {
  int id;
  String ad;
  String image;
  String kategori;
  int fiyat;
  String marka;

  Product({
    required this.id,
    required this.ad,
    required this.image,
    required this.kategori,
    required this.fiyat,
    required this.marka,
  });

  factory Product.fromJSON(Map<String, dynamic> json) {
    return Product(
      id: int.tryParse(json["id"].toString()) ?? 0,
      ad: json["ad"]?.toString() ?? "Bilinmiyor",
      image: json["image"]?.toString() ?? "",
      kategori: json["kategori"]?.toString() ?? "Bilinmiyor",
      fiyat: int.tryParse(json["fiyat"].toString()) ?? 0,
      marka: json["marka"]?.toString() ?? "Bilinmiyor",
    );
  }
}
