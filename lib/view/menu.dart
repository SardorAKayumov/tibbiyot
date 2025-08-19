import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuView extends StatelessWidget {
  const MenuView({
    super.key,
    required this.onStart,
    required this.languageCode,
    required this.widthDiff,
  });
  final VoidCallback onStart;
  final String languageCode;
  final double widthDiff;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 765.w * widthDiff,
          child: Text(
            languageCode == 'uz'
                ? 'XI asr tabibining interaktiv ustaxonasi'
                : languageCode == 'ru'
                    ? 'Тайны\nприроды'
                    : languageCode == 'en'
                        ? 'Mystery\nof Nature'
                        : languageCode == 'ar'
                            ? 'سر الطبيعة'
                            : languageCode == 'zh'
                                ? '自然之谜'
                                : 'Mystery\nof Nature',
            style: TextStyle(
              color: const Color(0xFF482319),
              fontSize: 96.w * widthDiff,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
        ),
        SizedBox(height: 48.h),
        SizedBox(
          width: 765.w * widthDiff,
          height: 140.h,
          child: ElevatedButton(
            onPressed: onStart,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF482319),
              shadowColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.75.r),
              ),
            ),
            child: Text(
              languageCode == 'uz'
                  ? 'BOSHLASH'
                  : languageCode == 'ru'
                      ? 'НАЧАТЬ'
                      : languageCode == 'en'
                          ? 'START'
                          : languageCode == 'ar'
                              ? 'ابدأ'
                              : languageCode == 'zh'
                                  ? '开始'
                                  : 'START',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
