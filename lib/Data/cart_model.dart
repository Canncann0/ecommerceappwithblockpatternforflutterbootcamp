class CartModel {
  int sepetId;
  String ad;
  String image;
  String kategori;
  int fiyat;
  String marka;
  int siparisAdeti;
  String kullaniciAdi = "dogancan";

  CartModel({
    required this.sepetId,
    required this.ad,
    required this.image,
    required this.kategori,
    required this.fiyat,
    required this.marka,
    required this.siparisAdeti,
    required this.kullaniciAdi,
  });

  factory CartModel.fromJSON(Map<String, dynamic> json) {
    return CartModel(
      sepetId: int.tryParse(json["sepetId"].toString()) ?? 0,
      ad: json["ad"]?.toString() ?? "Bilinmiyor",
      image: json["image"]?.toString() ?? "",
      kategori: json["kategori"]?.toString() ?? "Bilinmiyor",
      fiyat: int.tryParse(json["fiyat"].toString()) ?? 0,
      marka: json["marka"]?.toString() ?? "Bilinmiyor",
      siparisAdeti: int.tryParse(json["siparisAdeti"].toString()) ?? 0,
      kullaniciAdi: json["kullaniciAdi"]?.toString() ?? "dogancan",
    );
  }
}
