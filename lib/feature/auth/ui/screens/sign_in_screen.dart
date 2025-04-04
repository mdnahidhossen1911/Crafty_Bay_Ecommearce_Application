import 'package:crafty_bay/feature/auth/ui/widgets/app_logo.dart';
import 'package:crafty_bay/feature/core/extensions/app_localization_extension.dart';
import 'package:crafty_bay/feature/core/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  static String name = '/signIn';

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
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
                context.localization.welcomeback,
                style: context.textTheme.titleLarge,
              ),
              Text(
                context.localization.plzEnterEmailPass,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(height: 14),
              TextField(
                decoration: InputDecoration(
                  hintText: context.localization.email,
                ),
              ),
              SizedBox(height: 14),
              TextField(
                decoration: InputDecoration(
                  hintText: context.localization.password,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  context.localization.signIn,
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
