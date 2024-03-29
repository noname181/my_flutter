import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_flutter_app/models/sns_login_model.dart';
import 'package:first_flutter_app/pages/index.dart';
import 'package:flutter/material.dart';
import '../../providers/sns/sns-login/mixin/kakao_auth_mixin.dart';
import '../../utils/extension/enums/sns_type_enum.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with KakaoAuthMixin {
  FirebaseAuth auth = FirebaseAuth.instance;

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  Future<SnsLoginModel?> signInFollowSNS(SNSType type) async {
    try {
      SnsLoginModel? snsUser;
      switch (type) {
        case SNSType.kakao:
          snsUser = await loginKaKao();
          break;
        // case SNSType.google:
        //   snsUser = await signInByGoogle();
        //   break;
        // case SNSType.naver:
        //   snsUser = await signInByNaver();
        //   break;
        // case SNSType.apple:
        //   snsUser = await signInWithApple();
        //   break;
        default:
          break;
      }
      return snsUser;
    } catch (e) {
      // AppLogger.error('Error signInFollowSNS: ${type.toString()} ${e.toString()}');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: "Email",
                  icon: Icon(Icons.email_outlined),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(
                  hintText: "Password",
                  icon: Icon(Icons.password_outlined),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    auth
                        .signInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text)
                        .whenComplete(
                          () => ScaffoldMessenger.of(context)
                              .showSnackBar(
                                const SnackBar(
                                  content: Text("Logged In Successfully"),
                                ),
                              )
                              .closed
                              .whenComplete(
                                () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyApp(),
                                  ),
                                ),
                              ),
                        );
                  }
                },
                label: const Text(
                  "Sign In",
                ),
                icon: const Icon(Icons.login_outlined),
              ),
              const SizedBox(
                height: 10,
              ),
              OutlinedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    auth
                        .createUserWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text)
                        .whenComplete(
                          () => ScaffoldMessenger.of(context)
                              .showSnackBar(
                                const SnackBar(
                                  content: Text("Successfully Signed Up"),
                                ),
                              )
                              .closed
                              .whenComplete(
                                () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const MyApp(),
                                  ),
                                ),
                              ),
                        );
                  }
                },
                icon: const Icon(Icons.add_circle_outline_outlined),
                label: const Text("Sign Up"),
              ),
              ElevatedButton(
                onPressed: () {
                  signInFollowSNS(
                    SNSType.kakao,
                  );
                },
                child: const Text('Kakao Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
