class MovieListModel {

  String? code;
  String? message;
  String? messageKh;
  List<Data>? data;


  MovieListModel({this.code, this.message, this.messageKh, this.data});

  MovieListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    messageKh = json['messageKh'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  get movies => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    data['messageKh'] = this.messageKh;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? address;
  String? status;

  Data({this.id, this.name, this.address, this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    status = json['status'];
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['status'] = this.status;
    return data;
  }
}
