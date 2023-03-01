import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike/theme.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/nike_logo.png',
              width: 180,
            ),
            const SizedBox(
              height: 24,
            ),
            const Text(
              'به فروشگاه اینترنتی نایک \n خوش آمدید',
              style: TextStyle(
                  fontFamily: 'dana',
                  fontWeight: FontWeight.bold,
                  color: LightTheme.primaryColor,
                  fontSize: 16),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            isLogin
                ? SizedBox(
                    height: 0,
                  )
                : Text('اطلاعات خود را جهت عضویت\nدر سایت وارد کنید'),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: LightTheme.primaryColor.withOpacity(0.6)),
                        borderRadius: BorderRadius.circular(15)),
                    child: const TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          floatingLabelStyle:
                              TextStyle(color: LightTheme.secondaryTextColor),
                          labelStyle: TextStyle(
                              fontFamily: 'dana',
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                          labelText: 'آدرس ایمیل',
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  _PasswordTextFiled(labelText: 'رمز عبور'),
                  const SizedBox(
                    height: 12,
                  ),
                  isLogin
                      ? const SizedBox(
                          height: 0,
                        )
                      : _PasswordTextFiled(labelText: 'تکرار رمز عبور'),
                  isLogin
                      ? const SizedBox(
                          height: 0,
                        )
                      : const SizedBox(
                          height: 12,
                        ),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor: MaterialStateProperty.all(
                                Colors.black.withOpacity(0.8))),
                        onPressed: () {},
                        child: const Text(
                          'ورود',
                          style: TextStyle(fontFamily: 'dana', fontSize: 20),
                        )),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  isLogin ? 'حساب کاربری ندارید ؟' : 'حساب کاربری دارید ؟',
                  style: TextStyle(fontFamily: 'dana'),
                ),
                const SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: Text(
                    isLogin ? 'ثبت نام' : 'ورود',
                    style: TextStyle(
                        fontFamily: 'dana',
                        decoration: TextDecoration.underline,
                        color: Colors.blue),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _PasswordTextFiled extends StatefulWidget {
  final String labelText;
  const _PasswordTextFiled({required this.labelText});

  @override
  State<_PasswordTextFiled> createState() =>
      _PasswordTextFiledState(label: labelText);
}

class _PasswordTextFiledState extends State<_PasswordTextFiled> {
  bool isObsecured = true;
  final String label;
  _PasswordTextFiledState({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: LightTheme.primaryColor.withOpacity(0.6)),
          borderRadius: BorderRadius.circular(15)),
      child: TextField(
        keyboardType: TextInputType.visiblePassword,
        obscureText: isObsecured,
        decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isObsecured = !isObsecured;
                  });
                },
                icon: isObsecured
                    ? const Icon(
                        CupertinoIcons.eye,
                        color: LightTheme.secondaryColor,
                        size: 20,
                      )
                    : const Icon(
                        Icons.visibility_off_outlined,
                        color: LightTheme.secondaryColor,
                        size: 20,
                      )),
            floatingLabelBehavior: FloatingLabelBehavior.never,
            floatingLabelStyle:
                const TextStyle(color: LightTheme.secondaryTextColor),
            labelStyle: const TextStyle(
                fontFamily: 'dana', fontSize: 14, fontWeight: FontWeight.bold),
            labelText: label,
            border: const OutlineInputBorder(borderSide: BorderSide.none)),
      ),
    );
  }
}
