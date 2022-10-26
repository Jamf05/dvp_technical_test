import 'package:dvp_technical_test/core/page/base_stateless.dart';
import 'package:dvp_technical_test/features/app/custom/components/custom_invisible_app_bar.dart';
import 'package:flutter/material.dart';

class AddressDetailPage extends BaseStateless {
  static const route = "/AddressDetailPage";
  const AddressDetailPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    BaseStateless.init(context);
    return Scaffold(
      appBar: CustomInvisibleAppBar(),
      body: const Center(child: Text("AddressDetailPage"),),
    );
  }
}