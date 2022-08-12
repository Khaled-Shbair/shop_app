import 'package:flutter/material.dart';
import '../../api/api paths.dart';
import '../../api/controller.dart';
import '../../api/dio.dart';
import '../../api/response.dart';
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

  Widget mobileField() {
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
          mobileField(),
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
    showSnackBar(context, message: 'Enter required data!', error: false);
    return false;
  }

  Future<void> _login() async {
    Controller().login(
      context,
      mainScreen,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }
}
/*
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/login cubit.dart';
import '../../bloc/login state.dart';
import '../../constants/string.dart';
import '../../widgets/input filed.dart';
import '../../widgets/password filed.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // var formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool _obscureText = true;

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

  Widget mobileField() {
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
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {},
        builder: (context, state) {
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
                mobileField(),
                sizedBox(),
                passwordField(),
                sizedBox(),
                loginButton(),
                sizedBox(),
                createButton(),
              ],
            ),
          );
        },
      ),
    );
  }

  void _preformLogin() {
    if (_checkData()) {
      _login();
    }
  }

  bool _checkData() {
    if (_passwordController.text.isNotEmpty &&
        _emailController.text.isNotEmpty) {
      return true;
    }
    return false;
  }

  void _login() {
    return LoginCubit.get(context).userLogin(
      email: _emailController.text,
      password: _passwordController.text,
    );
  }
}

  */
