import 'package:crafty_bay/app/app_color.dart';
import 'package:crafty_bay/feature/auth/ui/widgets/app_logo.dart';
import 'package:crafty_bay/feature/core/extensions/app_localization_extension.dart';
import 'package:crafty_bay/feature/core/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  static String name = '/OtpVerification';

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0, forceMaterialTransparency: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            children: [
              SizedBox(height: 120),
              AppLogo(),
              SizedBox(height: 16),
              Text(
                context.localization.enterOtp,
                style: context.textTheme.titleLarge,
              ),
              Text(
                context.localization.otpSent,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              SizedBox(height: 20),
              _buildPinCodeTextField(),

              SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  text: context.localization.otpExpire,
                  style: TextStyle(color: Colors.grey),
                  children: [
                    TextSpan(
                      text: '120s',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.themeColor,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  context.localization.resendCode,
                  style: TextStyle(color: AppColors.themeColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPinCodeTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: PinCodeTextField(
        length: 4,
        animationType: AnimationType.fade,
        keyboardType: TextInputType.number,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 50,
          activeFillColor: Colors.white,
          selectedFillColor: AppColors.themeColor,
          inactiveFillColor: Colors.teal.shade50,
          activeColor: AppColors.themeColor,
          selectedColor: AppColors.themeColor,
          inactiveColor: Colors.white,
        ),
        animationDuration: const Duration(milliseconds: 300),
        backgroundColor: Colors.transparent,
        enableActiveFill: true,
        appContext: context,
        onChanged: (value) {},
      ),
    );
  }
}
