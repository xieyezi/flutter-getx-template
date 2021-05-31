import 'package:flutter/material.dart';
import 'package:flutter_getx_template/components/components.dart';
import 'package:flutter_getx_template/components/custom_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBar: MyAppBar(
        centerTitle: true,
        title: MyTitle('首页'),
      ),
      body: Container(
        child: Center(
          child: Text('这是首页'),
        ),
      ),
    );
  }
}
