import 'package:crafty_bay/feature/auth/ui/widgets/app_logo.dart';
import 'package:crafty_bay/feature/core/extensions/app_localization_extension.dart';
import 'package:crafty_bay/feature/core/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  static String name = '/signUp';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0, forceMaterialTransparency: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: [
              SizedBox(height: 100),
              AppLogo(),
              SizedBox(height: 16),
              Text(
                context.localization.completeProfile,
                style: context.textTheme.titleLarge,
              ),
              Text(
                context.localization.signUpdetails,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(height: 14),
              TextField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: context.localization.firstName,
                ),
              ),
              SizedBox(height: 14),
              TextField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: context.localization.lastName,
                ),
              ),
              SizedBox(height: 14),
              TextField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: context.localization.mobile,
                ),
              ),
              SizedBox(height: 14),
              TextField(
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  hintText: context.localization.password,
                ),
              ),
              SizedBox(height: 14),
              TextField(
                maxLines: 3,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                  hintText: context.localization.address,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  context.localization.registration,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
