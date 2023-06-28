import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyText extends StatelessWidget {
  final Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final bool isPasswordField;
  final bool isEnabled;
  final bool readOnly;
  final String hintText;
  final String initialValue;
  final double width;
  final double borderRadius;
  final double height;
  final  int maxLength;
  final  int maxLine;
  final TextStyle? textStyle;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
   TextEditingController? controller;
  final TextInputType? keyboardType;
  final  void Function()? onSuffixItemTapped;
  final  void Function()? onPrefixItemTapped;
  final  EdgeInsetsGeometry? contentPadding;
  final bool isNaira;
  final bool alignCenter;

   MyText({
    super.key,
    this.validator,
    this.isPasswordField = false,
    this.isEnabled = true,
    this.hintText = "",
    this.initialValue = '',
    this.width = double.infinity,
    this.borderRadius = 10,
    this.height = 20,
    this.textStyle,
    this.suffixIcon,
    this.prefixIcon,
    this.readOnly = false,
    this.maxLength = 80,
    this.maxLine = 1,
    this.onSuffixItemTapped,
    this.onPrefixItemTapped,
    this.keyboardType,
    this.controller,
    this.contentPadding,
    this.onChanged,
    this.isNaira = false,
    this.alignCenter = false,
  });
  @override
  Widget build(BuildContext context) {
    bool usesSuffixIcon = (suffixIcon != null);
    bool usesPrefixIcon = (prefixIcon != null);
    // Screen screen = getScreen();
    return SizedBox(
      width:  width,
      child: TextFormField(
        enabled: isEnabled,
        onChanged: onChanged,
        controller: controller,
        obscureText: isPasswordField,
        maxLines: maxLine,
        readOnly: readOnly,
        maxLength: maxLength,
        validator: validator,
        keyboardType: isNaira && keyboardType == null
            ? TextInputType.number
            : keyboardType,
        inputFormatters: (keyboardType == TextInputType.number)
            ? [ FilteringTextInputFormatter.allow(RegExp("[0-9.]")) ]
            : null,
        textAlign: alignCenter?TextAlign.center:TextAlign.left,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle:const  TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),
          counterText: "",
          border: InputBorder.none,
          filled: true,
          fillColor: const Color(0xFFF2F4F7),
          prefixIcon:  usesPrefixIcon
              ? InkWell(
            onTap: onPrefixItemTapped,
            enableFeedback: true,
            child: prefixIcon,
          ): null,
          suffixIcon: usesSuffixIcon
              ? InkWell(
            onTap: onSuffixItemTapped,
            enableFeedback: true,
            child: suffixIcon,
          )
              : null,
          contentPadding: (contentPadding == null)
              ?const  EdgeInsets.symmetric(vertical: 3, horizontal: 10)
              : contentPadding,
        ),
        style: textStyle,
      ),
    );
  }
}
