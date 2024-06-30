class FavoriteModal {
  String city;
  int isFavorite;

  FavoriteModal(this.city, this.isFavorite);

  factory FavoriteModal.formMap({required Map data}) => FavoriteModal(
        data['city'],
        data['isFavorite'],
      );

  Map<String, dynamic> get getFavorite => {
        "city": city,
        "isFavorite": isFavorite,
      };
}
