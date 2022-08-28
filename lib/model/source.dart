class SourceModle {
  final String id;

  final String name;
  final String description;
  final String url;
  final String categoey;
  final String country;
  final String language;

  SourceModle(this.id, this.name, this.categoey, this.country, this.description,
      this.language, this.url);

  SourceModle.fromJson(Map<String, dynamic> json)
      :id =json["id"] ?? "",
        name =json["name"],
        description=json["description"] ?? "",
        url=json["url"] ?? "",
        country=json["country"] ?? "",
        categoey=json["category"] ?? "",
        language=json["language"] ?? "";
}