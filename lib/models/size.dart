class MySize {
  int? sizeId;
  String sizeName = "";


  MySize({required this.sizeId,required this.sizeName});

  MySize.fromJson(Map<String, dynamic> json) {
    sizeId = json['sizeId'];
    sizeName = json['sizeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sizeId'] = this.sizeId;
    data['sizeName'] = this.sizeName;
    return data;
  }
}