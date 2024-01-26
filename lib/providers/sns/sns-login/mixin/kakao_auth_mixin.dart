import 'package:first_flutter_app/models/sns_login_model.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

import '../../../../utils/extension/enums/sns_type_enum.dart';

mixin KakaoAuthMixin {
  Future<SnsLoginModel?> loginKaKao() async {
    try {
      bool? isInstalled = await isKakaoTalkInstalled();

      OAuthToken token = isInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();

      ('카카오톡으로 로그인 성공 ${token.accessToken}');

      var user = await UserApi.instance.me();
      // AppLogger.info(user);
      final accessToken = token.accessToken;
      final snsUser = SnsLoginModel(
        accessToken: accessToken,
        snsType: SNSType.kakao,
        email: user.kakaoAccount?.email,
      );
      return snsUser;
    } catch (error) {
      print(error);
      // AppLogger.error('Error loginKaKao : 카카오톡으로 로그인 실패 $error');
      // AppLogger.error(await KakaoSdk.origin);
      return null;
    }
  }
}
