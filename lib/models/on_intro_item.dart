import 'package:chamcong/core/constants/asset_path.dart';

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
