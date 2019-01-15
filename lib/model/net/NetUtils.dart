import 'dart:io';

import 'package:dio/dio.dart';
import 'package:kuguan_flutter/model/bean/ResultInfo.dart';
import 'package:kuguan_flutter/model/net/APIConstant.dart';
import 'package:kuguan_flutter/model/net/RequestListener.dart';
import 'package:kuguan_flutter/model/utils/LogUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';

///网络工具类
class NetUtils {
  static var _netUtils;
  static String authorization;

  static NetUtils getInstance() {
    if (null == _netUtils) {
      _netUtils = new NetUtils();
    }
    return _netUtils;
  }

  void getRequest(
      String url, Map<String, String> params, RequestListener listener) {
    _getRequestMethod(url, params, 'get', listener);
  }

  void postRequest(
      String url, Map<String, String> params, RequestListener listener) {
    _getRequestMethod(url, params, 'post', listener);
  }

  void _getRequestMethod(String url, Map<String, String> params, String method,
      RequestListener listener) async {
    var isPost = (method == 'post');
    SharedPreferences prefer = await SharedPreferences.getInstance();
    authorization = prefer.getString(StaticKey.KEY_ACCESS_TOKEN);

    Dio dio = Dio(Options(
        method: method,
        baseUrl: 'https://icmdve.gzfns.com/icm/gateway/',
        connectTimeout: 10000,
        receiveTimeout: 3000,
        contentType: ContentType.parse("application/x-www-form-urlencoded"),
        headers: _getHead()));

    //设置拦截器---请求发起之前
    dio.interceptor.request.onSend = (Options options) {
      LogUtils.showLog(NetUtils, '开始要进行网络请求了...');
      return options; //continue
    };
    //设置拦截器---请求成功,返回响应数据之前
    dio.interceptor.response.onSuccess = (Response response) {
      // 在返回响应数据之前做一些预处理
      LogUtils.showLog(NetUtils, '网络请求成功，即将返回数据...');
      return response; // continue
    };
    //设置拦截器---请求失败
    dio.interceptor.response.onError = (DioError e) {
      listener.onFail(e.toString());
      // 当请求失败时做一些预处理
      LogUtils.showLog(NetUtils, '网络请求失败，失败的原因是...${e.response.toString()}');

      return e; //continue
    };
    try {
      Response response;
      if (isPost) {
        //post请求
        response = await dio.post(url, data: params);
      } else {
        //get请求
        StringBuffer sb = new StringBuffer("?");
        params.forEach((key, value) {
          sb.write("$key" + "=" + "$value" + "&");
        });
        String paramStr = sb.toString();
        paramStr = paramStr.substring(0, paramStr.length - 1);
        url += paramStr;
        response = await dio.get(url);
      }
      return hanldRespose(response, listener);
    } catch (e) {
      return print(e);
    }
  }

  ///设置请求头
  _getHead() {
    return {
      'Content-Type': 'application/json;charset=UTF-8',
      'client_type': 'APP',
      'Connection': 'keep-alive',
      'Authorization': authorization,
    };
  }

  ///处理返回的数据结果
  void hanldRespose(Response response, RequestListener listener) {
    var resultInfo = ResultInfo.fromJson(response.data);
    int code = int.parse(resultInfo.code);
    if (!bool.fromEnvironment("dart.vm.product")) {
      LogUtils.showLog(NetUtils, 'code=${resultInfo.code}');
      LogUtils.showLog(NetUtils, 'code===${code}');
      LogUtils.showLog(NetUtils, 'msg=${resultInfo.msg}');
      LogUtils.showLog(NetUtils, 'state=${resultInfo.state}');
      LogUtils.showLog(NetUtils, 'friendlyMsg=${resultInfo.friendlyMsg}');
      LogUtils.showLog(NetUtils, 'data=${resultInfo.data}');
    }
    if (code >= 0 && code <= 99) {
      //数据正常，接口访问成功
      listener.onSucess(resultInfo.data);
    } else {
      listener.onFail(resultInfo.friendlyMsg);

      //接口访问失败
      if (code == 1004) {
        //登陆过期重新登陆

      } else if (code == 1005) {
        //别处登陆或者未登陆，强制下线
      } else {
        //访问失败

      }
    }
  }
}
