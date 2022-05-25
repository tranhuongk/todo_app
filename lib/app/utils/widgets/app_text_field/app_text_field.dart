import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:todo_app/app/themes/app_colors.dart';
import 'package:todo_app/app/themes/app_text_styles.dart';
import 'package:todo_app/app/translations/app_translations.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    this.hintText,
    this.errorText,
    this.obscureText,
    this.controller,
    this.margin,
    this.backgroundColor = AppColors.white,
    this.onChanged,
  }) : super(key: key);
  final String? hintText;
  final String? errorText;
  final bool? obscureText;
  final TextEditingController? controller;
  final EdgeInsets? margin;
  final Color backgroundColor;
  final Function(String)? onChanged;
  @override
  _AppTextFieldState createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final RxBool _obscureText = false.obs;
  @override
  void initState() {
    super.initState();
    _obscureText.value = widget.obscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 48,
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              borderRadius: BorderRadius.circular(48),
              border: (widget.errorText != null && widget.errorText!.isNotEmpty)
                  ? Border.all(color: AppColors.red)
                  : null,
            ),
            child: Obx(
              () => TextField(
                controller: widget.controller,
                obscureText: _obscureText.value,
                onChanged: widget.onChanged,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hintText,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                  hintStyle: AppTextStyles.base.hintTextColor.s14,
                  suffixIcon: widget.obscureText != null
                      ? GestureDetector(
                          onTap: () => _obscureText.value = !_obscureText.value,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: _obscureText.value
                                ? const Icon(CupertinoIcons.eye_slash)
                                : const Icon(CupertinoIcons.eye),
                          ),
                        )
                      : const SizedBox(),
                  suffixIconConstraints: const BoxConstraints(
                    maxWidth: 32,
                  ),
                ),
              ),
            ),
          ),
          if (widget.errorText != null && widget.errorText!.isNotEmpty)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16).copyWith(top: 2),
              child: Text(
                widget.errorText ?? AppTranslationKey.noEmpty,
                style: AppTextStyles.base.s12.redColor.italic,
              ),
            ),
        ],
      ),
    );
  }
}
