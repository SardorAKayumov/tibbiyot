import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../colors.dart';
import '../locale_provider.dart';

class BottomWidget extends StatefulWidget {
  const BottomWidget({
    super.key,
    required this.onBack,
    required this.onZoomIn,
    required this.onHome,
  });
  final VoidCallback onBack;
  final VoidCallback onZoomIn;
  final VoidCallback onHome;

  @override
  State<BottomWidget> createState() => _BottomWidgetState();
}

class _BottomWidgetState extends State<BottomWidget> {
  final Color iconColor = const Color(0xFF482319);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.h),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: const Color(0xFF482319),
            width: 4.h,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 60.h,
            height: 60.h,
            child: CupertinoButton(
              onPressed: widget.onBack,
              padding: EdgeInsets.zero,
              child: SvgPicture.asset(
                'assets/arrow_back.svg',
                width: 60.h,
                height: 60.h,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              ),
            ),
          ),
          SizedBox(width: 36.w),
          SizedBox(
            width: 60.h,
            height: 60.h,
            child: CupertinoButton(
              onPressed: widget.onZoomIn,
              padding: EdgeInsets.zero,
              child: SvgPicture.asset(
                'assets/zoom_in.svg',
                width: 60.h,
                height: 60.h,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              ),
            ),
          ),
          SizedBox(width: 36.w),
          _buildLanguageSelector(),
          SizedBox(width: 36.w),
          SizedBox(
            width: 60.h,
            height: 60.h,
            child: CupertinoButton(
              onPressed: widget.onHome,
              padding: EdgeInsets.zero,
              child: SvgPicture.asset(
                'assets/home.svg',
                width: 60.h,
                height: 60.h,
                colorFilter: ColorFilter.mode(iconColor, BlendMode.srcIn),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLanguageSelector() {
    final currentLocale =
        Provider.of<LocaleProvider>(context).locale.languageCode;

    return Row(
      children: List.generate(
        locales.length,
        (index) => Padding(
          padding: EdgeInsets.only(left: index == 0 ? 0 : 36.w),
          child: GestureDetector(
            onTap: () {
              Provider.of<LocaleProvider>(context, listen: false)
                  .setLocale(Locale(locales[index]));
            },
            child: Container(
              width: 60.h,
              height: 60.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentLocale == locales[index]
                    ? const Color(0xFF482319)
                    : Colors.transparent,
                border: Border.all(
                  color: currentLocale == locales[index]
                      ? Colors.transparent
                      : const Color(0xFF482319),
                  width: 2.h,
                ),
              ),
              child: Center(
                child: Text(
                  localeText[locales[index]] ?? '',
                  style: TextStyle(
                    color: currentLocale == locales[index]
                        ? AppColors.neutralBase
                        : const Color(0xFF482319),
                    fontSize: 16.h,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
