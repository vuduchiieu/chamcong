class InfoUserCompany {
  final dynamic id;
  final ComInfo comInfo;
  final int authentic;
  final UserInfo userInfo;
  final String accessToken;
  final String refreshToken;
  final int type;
  final String epPhoneTk;
  final String password;

  InfoUserCompany({
    required this.id,
    required this.comInfo,
    required this.authentic,
    required this.userInfo,
    required this.accessToken,
    required this.refreshToken,
    required this.type,
    required this.epPhoneTk,
    required this.password,
  });

  factory InfoUserCompany.fromJson(Map<String, dynamic> json) =>
      InfoUserCompany(
        id: json["_id"] ?? -1,
        comInfo: ComInfo.fromJson(json["com_info"]),
        authentic: json["authentic"] ?? -1,
        userInfo: UserInfo.fromJson(json["user_info"]),
        accessToken: json["access_token"] ?? '',
        refreshToken: json["refresh_token"] ?? '',
        type: json["type"] ?? -1,
        epPhoneTk: json["ep_phone_tk"] ?? '',
        password: json["password"] ?? '',
      );
}

class ComInfo {
  final int comId;
  final String? comEmail;

  ComInfo({required this.comId, this.comEmail});

  factory ComInfo.fromJson(Map<String, dynamic> json) => ComInfo(
        comId: json['com_id'] ?? -1,
        comEmail: json['com_email'],
      );
}

class UserInfo {
  final int comId;
  final String comName;
  final String comEmail;
  final String comPhoneTk;
  final String typeTimeKeeping;
  final String idWayTimekeeping;
  final String comLogo;
  final String comPass;
  final String comAddress;
  final int comRoleId;
  final int comSize;
  final String comDescription;
  final int comCreateTime;
  final int comUpdateTime;
  final int comAuthentic;
  final String comLat;
  final String comLng;
  final String comQrLogo;
  final int enableScanQr;
  final int comVip;
  final int comEpVip;
  final int epCrm;
  final int scan;
  final String comPassEncrypt;
  final String comPath;
  final String base36Path;
  final String fromSource;
  final String comIdTv365;
  final String comQuantityTime;
  final String comKd;
  final String checkPhone;

  UserInfo({
    required this.comId,
    required this.comName,
    required this.comEmail,
    required this.comPhoneTk,
    required this.typeTimeKeeping,
    required this.idWayTimekeeping,
    required this.comLogo,
    required this.comPass,
    required this.comAddress,
    required this.comRoleId,
    required this.comSize,
    required this.comDescription,
    required this.comCreateTime,
    required this.comUpdateTime,
    required this.comAuthentic,
    required this.comLat,
    required this.comLng,
    required this.comQrLogo,
    required this.enableScanQr,
    required this.comVip,
    required this.comEpVip,
    required this.epCrm,
    required this.scan,
    required this.comPassEncrypt,
    required this.comPath,
    required this.base36Path,
    required this.fromSource,
    required this.comIdTv365,
    required this.comQuantityTime,
    required this.comKd,
    required this.checkPhone,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        comId: json['com_id'] ?? -1,
        comName: json['com_name'] ?? '',
        comEmail: json['com_email'] ?? '',
        comPhoneTk: json['com_phone_tk'] ?? '',
        typeTimeKeeping: json['type_timekeeping'] ?? '',
        idWayTimekeeping: json['id_way_timekeeping'] ?? '',
        comLogo: json['com_logo'] ?? '',
        comPass: json['com_pass'] ?? '',
        comAddress: json['com_address'] ?? '',
        comRoleId: json['com_role_id'] ?? -1,
        comSize: json['com_size'] ?? -1,
        comDescription: json['com_description'] ?? '',
        comCreateTime: json['com_create_time'] ?? -1,
        comUpdateTime: json['com_update_time'] ?? -1,
        comAuthentic: json['com_authentic'] ?? -1,
        comLat: json['com_lat'] ?? '',
        comLng: json['com_lng'] ?? '',
        comQrLogo: json['com_qr_logo'] ?? '',
        enableScanQr: json['enable_scan_qr'] ?? -1,
        comVip: json['com_vip'] ?? -1,
        comEpVip: json['com_ep_vip'] ?? -1,
        epCrm: json['ep_crm'] ?? -1,
        scan: json['scan'] ?? -1,
        comPassEncrypt: json['com_pass_encrypt'] ?? '',
        comPath: json['com_path'] ?? '',
        base36Path: json['base36_path'] ?? '',
        fromSource: json['from_source'] ?? '',
        comIdTv365: json['com_id_tv365'] ?? '',
        comQuantityTime: json['com_quantity_time'] ?? '',
        comKd: json['com_kd'] ?? '',
        checkPhone: json['check_phone'] ?? '',
      );
}
