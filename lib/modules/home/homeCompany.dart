import 'package:chamcong/core/models/info_user_company.dart';
import 'package:flutter/material.dart';

class HomeCompany extends StatefulWidget {
  const HomeCompany({
    super.key,
  });

  @override
  State<HomeCompany> createState() => _HomeCompanyState();
}

class _HomeCompanyState extends State<HomeCompany> {
  InfoUserCompany? infoUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    infoUser = arguments['infoUser'];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text(
              infoUser?.userInfo.comName ?? '',
              style: const TextStyle(fontSize: 14),
            ),
            actions: null),
        body: SafeArea(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              Text('Xin chào: ${infoUser?.userInfo.comName ?? ""}'),
              const SizedBox(height: 20),
              const Text('Đây là màn công ty')
            ]))));
  }
}
