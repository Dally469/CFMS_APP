class CategoryModel {
  String value;
  String text;

  CategoryModel(
      this.value,
      this.text,
      );
  CategoryModel.fromJson(Map<dynamic, dynamic> json)
      : value = json['value'],
        text = json['text'];

  Map<String, Object?> toJson() {
    return {
      'value': value,
      'text': text,
    };
  }
}