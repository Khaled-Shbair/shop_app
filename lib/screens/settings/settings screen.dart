import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../bloc/shop bloc/setting get.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  SettingGet settingGet = Get.put(SettingGet());

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Setting'));
  }
}

class InputFiled extends StatelessWidget {
  const InputFiled({
    Key? key,
    required this.nameController,
    required this.labelText,
    required this.prefixIcon,
  }) : super(key: key);

  final TextEditingController nameController;
  final IconData prefixIcon;
  final String labelText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: nameController,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}
/*
 @override
  Widget build(BuildContext context) {
    return GetX<SettingGet>(
      init: SettingGet(),
      global: true,
      builder: (controller) {
        if (controller.loading.isTrue) {
          return const Center(child: CircularProgressIndicator());
        }
        //  _phoneController.text = settingGet.user.data!.phone;
        //  _emailController.text = settingGet.user.data!.email;
        //  _nameController.text = settingGet.user.data!.name;
        return ListView(
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsetsDirectional.all(20),
          children: [
            InputFiled(
              nameController: _nameController,
              labelText: 'Name',
              prefixIcon: Icons.person,
            ),
            const SizedBox(height: 10),
            InputFiled(
              nameController: _emailController,
              labelText: 'Email',
              prefixIcon: Icons.mail,
            ),
            const SizedBox(height: 10),
            InputFiled(
              nameController: _phoneController,
              labelText: 'Phone',
              prefixIcon: Icons.phone_android,
            ),
          ],
        );
      },
    );
  }
 */
