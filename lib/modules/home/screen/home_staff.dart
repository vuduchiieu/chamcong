import 'package:chamcong/models/info_user_staff.dart';
import 'package:flutter/material.dart';

class HomeStaff extends StatefulWidget {
  final InfoUserStaff infoUser;
  const HomeStaff({super.key, required this.infoUser});

  @override
  State<HomeStaff> createState() => _HomeStaffState();
}

class _HomeStaffState extends State<HomeStaff> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
              widget.infoUser.userInfo.comName,
              style: const TextStyle(fontSize: 14),
            ),
            actions: null),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text('Xin chào culi: ${widget.infoUser.userInfo.epName}'),
                const SizedBox(height: 20),
                const Text('Đây là màn nhân viên')
              ])),
        ));
  }
}
