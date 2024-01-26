// import '../../styles/images_style.dart';

enum SNSType {
  phone,
  kakao,
  naver,
  google,
  apple,
  bio;

  String get title => switch (this) {
        phone => '휴대폰으로 회원가입',
        kakao => '카카오로 회원가입',
        naver => '네이버로 회원가입',
        google => '구글로 회원가입',
        apple => '애플로 회원가입',
        bio => '',
      };

  String get type => switch (this) {
        phone => '',
        kakao => 'KAKAO',
        naver => 'NAVER',
        google => 'GOOGLE',
        apple => 'APPLE',
        bio => 'BIO',
      };

  String get name => switch (this) {
        phone => '',
        kakao => '카카오',
        naver => '네이버',
        google => '구글',
        apple => 'Apple',
        bio => '바이오',
      };

  // String get image => switch (this) {
  //       phone => ImagesStyles.loginPhone,
  //       kakao => ImagesStyles.loginKakao,
  //       naver => ImagesStyles.loginNaver,
  //       google => ImagesStyles.loginGoogle,
  //       apple => ImagesStyles.loginApple,
  //       bio => ImagesStyles.loginBio,
  //     };

  String get snsInterworking => switch (this) {
        phone => '',
        kakao => '카카오 연동',
        naver => '네이버 연동',
        google => '구글 연동',
        apple => '애플 연동',
        bio => '생체인식 연동',
      };

  String get connectSNSError => switch (this) {
        phone => '',
        kakao => '카카오톡 회원가입이 취소 되었습니다.',
        naver => '네이버 회원가입이 취소 되었습니다.',
        google => '구글 회원가입이 취소 되었습니다.',
        apple => '애플 회원가입이 취소 되었습니다.',
        bio => '생체인식 회원가입이 취소 되었습니다.',
      };

  String get matchSNSError => switch (this) {
        phone => '',
        kakao => '카카오 계정은 이미 타 사용자에게 연동되어 있습니다.',
        naver => '네이버 계정은 이미 타 사용자에게 연동되어 있습니다.',
        google => '구글 계정은 이미 타 사용자에게 연동되어 있습니다.',
        apple => '애플 계정은 이미 타 사용자에게 연동되어 있습니다.',
        bio => '유효하지 않은 결제입니다.',
      };

  String get connectSNSSuccess => switch (this) {
        phone => '',
        kakao => '카카오톡 연동 되었습니다.',
        naver => '네이버 연동 되었습니다.',
        google => '구글 계정이 연동 되었습니다.',
        apple => '애플 계정이 연동 되었습니다.',
        bio => '생체인식 연동 되었습니다.',
      };
  EmailType get domainEmail => switch (this) {
        phone => EmailType.directInput,
        kakao => EmailType.kakao,
        naver => EmailType.naver,
        google => EmailType.gmail,
        apple => EmailType.directInput,
        bio => EmailType.directInput,
      };
}

extension SNSTypeConvert on String {
  SNSType getSNSType() {
    switch (this) {
      case 'KAKAO':
        return SNSType.kakao;
      case 'NAVER':
        return SNSType.naver;
      case 'GOOGLE':
        return SNSType.google;
      case 'APPLE':
        return SNSType.apple;
      case 'BIO':
        return SNSType.bio;
      default:
        return SNSType.bio;
    }
  }
}

enum EmailType {
  directInput,
  naver,
  kakao,
  gmail,
  hanmail,
  nate,
  daum;

  String get address => switch (this) {
        directInput => '',
        naver => 'naver.com',
        kakao => 'kakao.com',
        gmail => 'gmail.com',
        hanmail => 'hanmail.net',
        nate => 'nate.com',
        daum => 'daum.net',
      };

  String get name => switch (this) {
        directInput => '직접입력',
        naver => '네이버',
        kakao => '카카오',
        gmail => 'Gmail',
        hanmail => '한메일',
        nate => '네이트',
        daum => '다음',
      };
}
