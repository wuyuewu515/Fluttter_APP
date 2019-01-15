///库管中心的api接口
class APIConstant {
  ///认证、鉴权中心
  static String _AUTH_CENTER = "auth-center/";

  ///库存监管系统服务
  static String _ISS_SERVICE = "iss-service/";

  ///用户认证
  static String AUTHORIZE = _AUTH_CENTER + "authorize";

  /// 停车场搜索/获取停车场列表
  static String PARK_SEARCH = _ISS_SERVICE + "park/search";
}

///存储的key
class StaticKey {
  ///用户输入的登陆账号
   static String KEY_USER_NAME = 'user_name';
  ///用户输入的密码
   static String KEY_PASS_WORD = 'pass_word';
  ///当前用户的token
   static String KEY_ACCESS_TOKEN ='access_token';
}
