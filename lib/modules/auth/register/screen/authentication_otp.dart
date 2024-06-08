// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class WebViewApp extends StatefulWidget {
//   const WebViewApp(
//       {super.key,
//       required this.email,
//       this.typeOTP = TypeScreenToOtp.FORGOTPASSWORD,
//       this.userInfo,
//       this.isMD5 = true});

//   confirmSuccessHandle({String from = 'socket'}) async {
//     if (this.typeOTP == TypeScreenToOtp.FORGOTPASSWORD) {
//       AppRouter.replaceWithPage(context, AppPages.Auth_UpdatePass, arguments: {
//         'userTypeArg': userInfo?.userType ?? AuthRepo().userType,
//         'email': email,
//       });
//     } else {
//       AppDialogs.showLoadingCircle(context);
//       await Future.delayed(Duration(milliseconds: 500));
//       await loginHandle();
//     }
//   }

//   final String email;
//   final TypeScreenToOtp typeOTP;
//   final IUserInfo? userInfo;
//   final bool isMD5;

//   @override
//   State<WebViewApp> createState() => _WebViewAppState();
// }

// class _WebViewAppState extends State<WebViewApp> {
//   WebViewController? _viewController;

//   navigateHandle(NavigationRequest navigation) async {
//     if (navigation.url.contains(RegExp(r'chat365.timviec365.vn'))) {
//       await widget.confirmSuccessHandle(from: 'navigate');
//     }
//     return NavigationDecision.navigate;
//   }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('keeTube'),
//       ),
//       body: WebView(
//         gestureNavigationEnabled: true,
//         navigationDelegate: (v) async => await navigateHandle(v),
//         initialUrl: widget.typeOTP == TypeScreenToOtp.CONFIRMACCOUNT
//             ? ApiPath.sendOtpRegisterPhoneNumber(
//                 widget.email, widget.userInfo?.userType?.reverseID ?? 0)
//             : ApiPath.sendOtpForgotPassPhoneNumber(widget.email),
//         javascriptMode: JavascriptMode.unrestricted,
//       ),
//     );
//   }
// }
