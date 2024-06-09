import 'package:chamcong/core/api/api.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AuthenticationOtp extends StatefulWidget {
  final Map<String, dynamic> argument;
  const AuthenticationOtp({super.key, required this.argument});

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
          onNavigationRequest: (NavigationRequest request) {
            if (request.url == 'https://chat365.timviec365.vn/') {
              context.pop(true);
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(
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
