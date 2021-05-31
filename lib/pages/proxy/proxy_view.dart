import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_getx_template/components/components.dart';
import 'package:flutter_getx_template/utils/utils.dart';

class ProxyPage extends StatelessWidget {
  ProxyPage({Key? key}) : super(key: key);

  final TextEditingController _controllerIP = TextEditingController();
  final TextEditingController _controllerPort = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "代理设置",
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(hintText: '请输入IP'),
                controller: _controllerIP,
              ),
              height: 40,
              width: getDeviceWidth(context) - 80,
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: TextField(
                decoration: InputDecoration(hintText: '请输入端口'),
                controller: _controllerPort,
              ),
              height: 40,
              width: getDeviceWidth(context) - 80,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30),
              width: getDeviceWidth(context) - 60,
              height: 50,
              child: TextButton(child: Text('设置代理'), onPressed: () => setupProxy()),
            )
          ],
        ),
      ),
    );
  }

  // 设置代理
  void setupProxy() {
    String ip = _controllerIP.text.trim();
    String port = _controllerPort.text.trim();
    if (ip.isEmpty) {
      EasyLoading.showToast('IP不能为空');
      return;
    }
    if (port.isEmpty) {
      EasyLoading.showToast('端口不能为空');
      return;
    }
    Dio dio = Request().dio;
    // 在调试模式下需要抓包调试，所以我们使用代理，并禁用HTTPS证书校验
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (client) {
      client.findProxy = (uri) {
        print('走了代理----$ip:$port');
        return "PROXY $ip:$port";
      };
      //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
    };
    EasyLoading.showToast('代理设置成功');
  }
}
