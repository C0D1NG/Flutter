class SendOTPRequest {
  late String phone;

  SendOTPRequest({required this.phone});

  SendOTPRequest.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    return data;
  }
}

class VerifyOTPRequest {
  late String phone;
  late String otp;

  VerifyOTPRequest({required this.phone, required this.otp});

  VerifyOTPRequest.fromJson(Map<String, dynamic> json) {
    phone = json['phone'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone'] = phone;
    data['otp'] = otp;
    return data;
  }
}

class SignUpRequest {
  late String name;
  late String phone;
  late String email;

  SignUpRequest({
    required this.name,
    required this.phone,
    required this.email,
  });

  SignUpRequest.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['phone'] = phone;
    data['email'] = email;
    return data;
  }
}
