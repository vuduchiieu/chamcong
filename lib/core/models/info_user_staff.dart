class InfoUserStaff {
  final int id;
  final UserInfo userInfo;
  final String accessToken;
  final String refreshToken;
  final int type;
  final String epPhoneTk;
  final String password;

  InfoUserStaff({
    required this.id,
    required this.userInfo,
    required this.accessToken,
    required this.refreshToken,
    required this.type,
    required this.epPhoneTk,
    required this.password,
  });

  factory InfoUserStaff.fromJson(Map<String, dynamic> json) => InfoUserStaff(
        id: json["_id"] ?? -1,
        userInfo: UserInfo.fromJson(json["user_info"]),
        accessToken: json["access_token"] ?? '',
        refreshToken: json["refresh_token"] ?? '',
        type: json["type"] ?? -1,
        epPhoneTk: json["ep_phone_tk"] ?? '',
        password: json["password"] ?? '',
      );
}

class UserInfo {
  final int epId;
  final String epMail;
  final String epPhoneTk;
  final String comPhoneTk;
  final String epName;
  final String epPhone;
  final String epEmailLh;
  final String epPass;
  final int comId;
  final int depId;
  final String epAddress;
  final int epBirthDay;
  final int epGender;
  final int epMarried;
  final int epEducation;
  final int epExp;
  final int epAithentic;
  final int roleId;
  final String epImage;
  final int createTime;
  final int updateTime;
  final int startWorkingTime;
  final int positionId;
  final int groupId;
  final String epDescription;
  final String epFeaturedRecognition;
  final String epStatus;
  final int epSignature;
  final int allowUpdateFace;
  final int versionInUse;
  final int epIdTv365;
  final int scan;
  final String epPassEncrypt;
  final String fromSource;
  final String comName;

  UserInfo({
    required this.epId,
    required this.epMail,
    required this.epPhoneTk,
    required this.comPhoneTk,
    required this.epName,
    required this.epPhone,
    required this.epEmailLh,
    required this.epPass,
    required this.comId,
    required this.depId,
    required this.epAddress,
    required this.epBirthDay,
    required this.epGender,
    required this.epMarried,
    required this.epEducation,
    required this.epExp,
    required this.epAithentic,
    required this.roleId,
    required this.epImage,
    required this.createTime,
    required this.updateTime,
    required this.startWorkingTime,
    required this.positionId,
    required this.groupId,
    required this.epDescription,
    required this.epFeaturedRecognition,
    required this.epStatus,
    required this.epSignature,
    required this.allowUpdateFace,
    required this.versionInUse,
    required this.epIdTv365,
    required this.scan,
    required this.epPassEncrypt,
    required this.fromSource,
    required this.comName,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        epId: json['ep_id'] ?? -1,
        epMail: json['ep_mail'] ?? '',
        epPhoneTk: json['ep_phone_tk'] ?? '',
        comPhoneTk: json['com_phone_tk'] ?? '',
        epName: json['ep_name'] ?? '',
        epPhone: json['ep_phone'] ?? '',
        epEmailLh: json['ep_email_lh'] ?? '',
        epPass: json['ep_pass'] ?? '',
        comId: json['com_id'] ?? -1,
        depId: json['dep_id'] ?? -1,
        epAddress: json['ep_address'] ?? '',
        epBirthDay: json['ep_birth_day'] ?? -1,
        epGender: json['ep_gender'] ?? -1,
        epMarried: json['ep_married'] ?? -1,
        epEducation: json['ep_education'] ?? -1,
        epExp: json['ep_exp'] ?? -1,
        epAithentic: json['ep_authentic'] ?? -1,
        roleId: json['role_id'] ?? -1,
        epImage: json['ep_image'] ?? '',
        createTime: json['create_time'] ?? -1,
        updateTime: json['update_time'] ?? -1,
        startWorkingTime: json['start_working_time'] ?? -1,
        positionId: json['position_id'] ?? -1,
        groupId: json['group_id'] ?? -1,
        epDescription: json['ep_description'] ?? '',
        epFeaturedRecognition: json['ep_featured_recognition'] ?? '',
        epStatus: json['ep_status'] ?? '',
        epSignature: json['ep_signature'] ?? -1,
        allowUpdateFace: json['allow_update_face'] ?? -1,
        versionInUse: json['version_in_use'] ?? -1,
        epIdTv365: json['ep_id_tv365'] ?? -1,
        scan: json['scan'] ?? -1,
        epPassEncrypt: json['ep_pass_encrypt'] ?? '',
        fromSource: json['from_source'] ?? '',
        comName: json['com_name'] ?? '',
      );
}
