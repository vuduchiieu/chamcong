import 'package:chamcong/core/api/api.dart';
import 'package:chamcong/core/widget/button_auth/handle_login.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AuthenticationOtp extends StatefulWidget {
  final Map<String, dynamic> argument;
  const AuthenticationOtp({
    super.key,
    required this.argument,
  });

  @override
  State<AuthenticationOtp> createState() => _AuthenticationOtpState();
}

class _AuthenticationOtpState extends State<AuthenticationOtp> {
  late final WebViewController controller;

  @override
  Future<void> didChangeDependencies() async {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onNavigationRequest: (NavigationRequest request) async {
            if (request.url.contains(RegExp(r'chat365.timviec365.vn'))) {
              await handleLogin(
                  type: 2,
                  context: context,
                  callByRegister: true,
                  account: widget.argument['account'],
                  password: widget.argument['password']);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
        // 'https://hungha365.com/xac-thuc-ma-otp-mk.html?account=${widget.argument['account']}&type=${widget.argument['type']}'
        '${Api.urlAuthenOtp}/${widget.argument['account']}/${widget.argument['type']}',
      ));

    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
            child: const Icon(
              Icons.arrow_back_ios,
            ),
            onTap: () => Navigator.pop(context)),
        title: const Text(
          'Xác thực OTP',
        ),
        centerTitle: true,
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
