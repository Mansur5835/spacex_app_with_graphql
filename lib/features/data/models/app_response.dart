class AppResponse<T> {
  T? data;
  List<Map>? errors;

  AppResponse(this.data, this.errors);

  Map<String, dynamic> toJson() {
    return {"data": data, "errors": errors};
  }

  AppResponse.fromJson(Map<String, dynamic> json) {
    data = json["data"];
    errors = json["errors"];
  }
}
