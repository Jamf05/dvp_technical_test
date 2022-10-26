import 'package:dvp_technical_test/core/page/base_stateless.dart';
import 'package:dvp_technical_test/features/app/custom/components/custom_invisible_app_bar.dart';
import 'package:dvp_technical_test/features/app/pages/address_detail_page.dart';
import 'package:flutter/material.dart';

class AddressListPage extends BaseStateless {
  static const route = "/AddressListPage";
  const AddressListPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    BaseStateless.init(context);
    return Scaffold(
      appBar: CustomInvisibleAppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => nav.to(const AddressDetailPage())
      ),
      body: const Center(child: Text("AddressListPage"),),
    );
  }
}