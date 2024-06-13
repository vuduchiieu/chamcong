import 'package:chamcong/models/info_user_company.dart';
import 'package:flutter/material.dart';

class HomeCompany extends StatefulWidget {
  final InfoUserCompany infoUser;
  const HomeCompany({super.key, required this.infoUser});

  @override
  State<HomeCompany> createState() => _HomeCompanyState();
}

class _HomeCompanyState extends State<HomeCompany> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text(
              widget.infoUser.userInfo.comName,
              style: const TextStyle(fontSize: 14),
            ),
            actions: null),
        body: SafeArea(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              Text('Xin chào: ${widget.infoUser.userInfo.comName}'),
              const SizedBox(height: 20),
              const Text('Đây là màn công ty')
            ]))));
  }
}
