import 'package:chamcong/core/constants/asset_path.dart';
import 'package:chamcong/core/theme/colors.dart';
import 'package:chamcong/core/theme/text_style.dart';
import 'package:chamcong/widget/button_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IntroAuth extends StatefulWidget {
  const IntroAuth({super.key});

  @override
  State<IntroAuth> createState() => _IntroAuthState();
}

class _IntroAuthState extends State<IntroAuth> {
  final PageController _controller = PageController(initialPage: 0);
  ValueNotifier<int> pageNumber = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Flexible(
            flex: 82,
            child: Column(
              children: [
                Flexible(
                  flex: 9,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      pageNumber.value = value;
                    },
                    controller: _controller,
                    itemCount: introItems.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Expanded(child: Image.asset(introItems[index].image)),
                          Text(
                            introItems[index].description,
                            textAlign: TextAlign.center,
                            style: TextStyles.text16w4Gray,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      iconSlide(0),
                      iconSlide(1),
                      iconSlide(2),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Flexible(
              flex: 13,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 4,
                    child: ButtonLogin(
                      textBtn: 'Đăng nhập',
                      src: '/select-auth',
                      isRegister: false,
                    ),
                  ),
                  Flexible(
                      flex: 4,
                      child: ButtonLogin(
                        textBtn: 'Đăng ký',
                        src: '/select-auth',
                        isRegister: true,
                      )),
                ],
              )),
          const Spacer(
            flex: 5,
          )
        ],
      ),
    );
  }

  Widget iconSlide(int pagevalue) {
    return IconButton(
        onPressed: () {
          setState(() {
            _controller.animateToPage(pagevalue,
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear);
            pageNumber.value = pagevalue;
          });
        },
        icon: ValueListenableBuilder<int>(
          valueListenable: pageNumber,
          builder: (context, value, child) {
            if (value == pagevalue) {
              // ignore: deprecated_member_use
              return SvgPicture.asset(AssetPath.dot, color: AppColors.primary);
            }
            return SvgPicture.asset(AssetPath.dot);
          },
        ));
  }
}

class OnIntroItem {
  final String description;
  final String image;

  const OnIntroItem({
    required this.description,
    required this.image,
  });
}

const List<OnIntroItem> introItems = [
  OnIntroItem(
    description:
        'Chat365 là ứng dụng nhắn tin nhanh và đa chức năng. Gửi tin nhắn, ảnh, video và tin nhắn thoại của bạn miễn phí.',
    image: AssetPath.introSt,
  ),
  OnIntroItem(
    description:
        'Trò chuyện với số lượng bạn bè không giới hạn, tiện lợi và là nơi bạn có thể thực hiện mọi thứ.',
    image: AssetPath.introNd,
  ),
  OnIntroItem(
    description: 'Họp bàn với quy mô lớn ở bất kỳ đâu với cuộc gọi video nhóm',
    image: AssetPath.introRd,
  ),
];
