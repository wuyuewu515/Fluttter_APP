import 'package:json_annotation/json_annotation.dart';

part 'LoginInfo.g.dart';

///登录信息的返回实体对象
@JsonSerializable()
class LoginInfo {
//  "access_token": "i43zTlFQnhfbswXI4Kgul7FQ7oi++MfKO1Wt04E+oqGTPz17rQEoACMljteb34VKvXW0Wy/W87X3Zccti2L8GgkgOlCgsR8IIMDlyOFFyDCSSYpL79Zz0NREo4K6B6QDvahJO+cW1NtQReXQzAA4J1IBq2+rumHhInEfrxxnXxRQHiW6lnc8hO/ywRxJv/FFMhZkzg8FmuM8UEfdmR1XF2+x6NIyupu/PnYHtDU1/wm7hvU7Af9WUW32sAsjT5/S6TmDUsPonZQJePJWHQjVmbLSMOnNOe47yuLrdKR08+/nagyfKR0xC6f5ZblTHX+UU/gRw9544RwfJyNtNleNgQvEmScpspiVRFXGABv1lfwFgj2TR4aAtCdFB0FeyT+IZ2sX4PsRbHTPayngSAl6Hnm2qHV1y1ijprvGbwOODzs=",
//  "refresh_token": "e0440edf999c53155e494726b4f6d057",
//  "expires_in": "1547539733108"

  String access_token;
  String refresh_token;
  String expires_in;

  LoginInfo(this.access_token, this.refresh_token, this.expires_in);

  factory LoginInfo.fromJson(Map<String, dynamic> json) =>
      _$LoginInfoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginInfoToJson(this);
}
