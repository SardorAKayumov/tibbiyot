import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../strings.dart';

class VictoryView extends StatelessWidget {
  const VictoryView({
    super.key,
    required this.languageCode,
    required this.onPlayAgain,
    required this.onHome,
    required this.ratio,
  });
  final VoidCallback onPlayAgain;
  final VoidCallback onHome;
  final String languageCode;
  final double ratio;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          successfulSurgery[languageCode] ?? '',
          style: TextStyle(
            color: const Color(0xFF482319),
            fontSize: 96.sp * ratio,
            fontWeight: FontWeight.w700,
            height: 1.2
          ),
        ),
        SizedBox(height: 48.h),
        Row(
          children: [
            SizedBox(
              width: 370.5.w * ratio,
              height: 140.h,
              child: ElevatedButton(
                onPressed: onHome,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF482319),
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.75.r),
                  ),
                ),
                child: Text(
                  goToHomeScreen[languageCode] ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.sp * ratio,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(width: 24.w * ratio),
            SizedBox(
              width: 370.5.w * ratio,
              height: 140.h,
              child: ElevatedButton(
                onPressed: onPlayAgain,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32.75.r),
                  ),
                ),
                child: Text(
                  playAgain[languageCode] ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF482319),
                    fontSize: 32.sp * ratio,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
