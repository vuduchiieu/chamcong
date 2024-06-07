import 'package:chamcong/core/models/info_user_staff.dart';
import 'package:flutter/material.dart';

class HomeStaff extends StatefulWidget {
  const HomeStaff({super.key});

  @override
  State<HomeStaff> createState() => _HomeStaffState();
}

class _HomeStaffState extends State<HomeStaff> {
  InfoUserStaff? infoUser;

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
        appBar: AppBar(
            title: Text(
              infoUser?.userInfo.comName ?? '',
              style: const TextStyle(fontSize: 14),
            ),
            actions: null),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text('Xin chào culi: ${infoUser?.userInfo.epName ?? ""}'),
                const SizedBox(height: 20),
                const Text('Đây là màn nhân viên')
              ])),
        ));
  }
}
