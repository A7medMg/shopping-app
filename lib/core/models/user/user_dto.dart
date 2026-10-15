import 'user_entity.dart';

class UserDto {
  UserData? message;

  UserDto({this.message});

  UserDto.fromJson(Map<String, dynamic> json) {
    message = json['message'] != null
        ? UserData.fromJson(json['message'])
        : null;
  }

  Map<String, dynamic> toJson() {
    return {'message': message?.toJson()};
  }
}

class UserData {
  String? id;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? image;

  UserData({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.address,
    this.image,
  });

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'address': address,
      'image': image,
    };
  }

  UserEntity toEntity() {
    return UserEntity(
      id: id ?? '',
      name: name ?? '',
      phone: phone ?? '',
      email: email ?? '',
      address: address ?? '',
      image: image ?? '',
    );
  }
}
