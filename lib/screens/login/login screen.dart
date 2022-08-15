import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../api/auth api controller.dart';
import '../../api/api response.dart';
import '../../constants/string.dart';
import '../../utils/helpers.dart';
import '../../widgets/input filed.dart';
import '../../widgets/password filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with helpers {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _obscureText = true;
  final AuthApiController _controller = Get.put(AuthApiController());

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Widget titleText() {
    return const Text(
      'Welcome back..',
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      ),
    );
  }

  Widget subTitleText() {
    return const Text(
      'Login to start using app',
      style: TextStyle(
        color: Colors.black45,
        fontWeight: FontWeight.w300,
        height: 1,
        fontSize: 17,
      ),
    );
  }

  Widget emailField() {
    return InputFiled(
      controller: _emailController,
      keyboard: TextInputType.emailAddress,
      prefixIcon: Icons.mail,
      hintText: 'Email',
    );
  }

  Widget passwordField() {
    return PasswordFiled(
      controller: _passwordController,
      keyboard: TextInputType.visiblePassword,
      obscureText: _obscureText,
      hintText: 'Password',
      prefixIcon: _obscureText ? Icons.lock_outline : Icons.lock_open,
      suffixIcon: _obscureText ? Icons.visibility : Icons.visibility_off,
      onPressed: () {
        setState(() {
          _obscureText = !_obscureText;
        });
      },
    );
  }

  Widget loginButton() {
    return ElevatedButton(
      onPressed: () => _preformLogin(),
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
      child: const Text('Login'),
    );
  }

  Widget createButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Don\'t have an account',
          style: TextStyle(
            color: Colors.black45,
            fontWeight: FontWeight.w300,
          ),
        ),
        TextButton(
            onPressed: () {
              Navigator.pushNamed(context, registerScreen);
            },
            child: const Text(
              'Create now!',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )),
      ],
    );
  }

  Widget sizedBox() => const SizedBox(height: 20);

  PreferredSizeWidget appBar() {
    return AppBar(
      title: const Text(
        'LOGIN',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: ListView(
        padding: const EdgeInsetsDirectional.all(20),
        physics: const NeverScrollableScrollPhysics(),
        children: [
          titleText(),
          subTitleText(),
          sizedBox(),
          emailField(),
          sizedBox(),
          passwordField(),
          sizedBox(),
          loginButton(),
          sizedBox(),
          createButton(),
        ],
      ),
    );
  }

  Future<void> _preformLogin() async {
    if (_checkData()) {
      await _login();
    }
  }

  bool _checkData() {
    if (_passwordController.text.isNotEmpty &&
        _emailController.text.isNotEmpty) {
      return true;
    }
    showSnackBar(message: 'Enter required data!', error: true);
    return false;
  }

  Future<void> _login() async {
    ApiResponse apiResponse = await _controller.login(
      email: _emailController.text,
      password: _passwordController.text,
    );
    showSnackBar(message: apiResponse.message, error: !apiResponse.status);
    if (apiResponse.status) {
      navigator();
    }
  }

  void navigator() {
    Navigator.pushReplacementNamed(context, shopLayout);
  }
}
