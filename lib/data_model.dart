class DataModel {
  final String name;
  final String body;
  final String style;
  final String html;

  DataModel(this.name, this.body, this.style, this.html);

  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel(
    json['name'] ?? "",
    json['body'] ?? "",
    json['style'] ?? "",
    json['htmcontent'] ?? "",
  );

  Map<String, dynamic> toJson() {
    return {'name': name, 'body': body, 'style': style, 'htmcontent': html};
  }
}
