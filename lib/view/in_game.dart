import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tibbiyot/model.dart/question.dart';

import '../model.dart/instrument.dart';
import '../strings.dart';
import '../widgets/inner_shadow.dart';

class InGameView extends StatefulWidget {
  const InGameView({
    super.key,
    required this.languageCode,
    required this.ratio,
    required this.onVictory,
  });
  final String languageCode;
  final double ratio;
  final VoidCallback onVictory;

  @override
  State<InGameView> createState() => _InGameViewState();
}

class _InGameViewState extends State<InGameView> {
  int step = 1;
  bool isCorrectInstrument = false;
  Instrument? lastChosenInstrument;

  late final double targetSize = 200.w * widget.ratio;
  late final double targetVisibleSize = 22.w * widget.ratio;

  @override
  void initState() {
    Instrument.instruments.shuffle();
    for (var instrument in Instrument.instruments) {
      instrument.visible = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:
          (MediaQuery.of(context).size.height / 9) * 16 - 165.w * widget.ratio,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: (((questions[step - 1].x).w) * widget.ratio) -
                (targetSize / 2 - targetVisibleSize / 2),
            top: (questions[step - 1].y).h -
                (targetSize / 2 - targetVisibleSize / 2),
            child: DragTarget<Instrument>(
              onAcceptWithDetails: (details) {
                setState(() {
                  lastChosenInstrument = details.data;
                });
                if (details.data == questions[step - 1].instrument) {
                  setState(() {
                    isCorrectInstrument = true;
                    step++;
                    Instrument.instruments.shuffle();
                    for (var instrument in Instrument.instruments) {
                      instrument.visible = true;
                    }
                  });
                  if (step > questions.length) {
                    widget.onVictory();
                  }
                } else {
                  setState(() {
                    isCorrectInstrument = false;
                    details.data.visible = false;
                  });
                }
              },
              builder: (context, candidateData, rejectedData) {
                return SizedBox(
                  width: targetSize,
                  height: targetSize,
                  child: Center(
                    child: Container(
                      width: targetVisibleSize,
                      height: targetVisibleSize,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue,
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Container(
                          width: targetVisibleSize - (4 * widget.ratio),
                          height: targetVisibleSize - (4 * widget.ratio),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            right: 0,
            child: SizedBox(
              width: 846.w * widget.ratio,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 846.w * widget.ratio,
                    height: 120.48.h,
                    padding:
                        EdgeInsets.symmetric(horizontal: 36.w * widget.ratio),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFBD7A1),
                      borderRadius: BorderRadius.circular(22.67.r),
                    ),
                    child: Center(
                      child: Text(
                        '$step-${task[widget.languageCode]}: ${questions[step - 1].question[widget.languageCode]}',
                        style: TextStyle(
                          color: const Color(0xFF482319),
                          fontSize: 34.88.sp * widget.ratio,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 51.52.h),
                  Wrap(
                    spacing: 24.w * widget.ratio,
                    runSpacing: 24.h,
                    children: List.generate(
                      Instrument.instruments.length,
                      (index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(17.r),
                          child: Container(
                            width: 150.w * widget.ratio,
                            height: 150.w * widget.ratio,
                            color: const Color(0xFFFBD7A1),
                            child: Stack(
                              children: [
                                InnerShadow(
                                  blur: 10,
                                  child: Container(),
                                ),
                                if (Instrument.instruments[index].visible)
                                  Draggable<Instrument>(
                                    data: Instrument.instruments[index],
                                    feedback: Material(
                                      color: Colors.transparent,
                                      child: Image.asset(
                                        Instrument.instruments[index].img,
                                        width: 150.w * widget.ratio,
                                        height: 150.w * widget.ratio,
                                      ),
                                    ),
                                    childWhenDragging: Opacity(
                                      opacity: 0.5,
                                      child: Image.asset(
                                        Instrument.instruments[index].img,
                                        width: 150.w * widget.ratio,
                                        height: 150.w * widget.ratio,
                                      ),
                                    ),
                                    child: Image.asset(
                                      Instrument.instruments[index].img,
                                      width: 150.w * widget.ratio,
                                      height: 150.w * widget.ratio,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 51.h),
                  if (lastChosenInstrument == null)
                    SizedBox(
                      width: 846.w * widget.ratio,
                      height: 126.48.h,
                    )
                  else
                    Container(
                      width: 846.w * widget.ratio,
                      height: 126.48.h,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(22.67.r)),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              isCorrectInstrument
                                  ? correctInstrumentChosen[
                                          widget.languageCode] ??
                                      ''
                                  : wrongInsturmentChosen[
                                          widget.languageCode] ??
                                      '',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: const Color(0xFF482319),
                                fontSize: (widget.languageCode == 'ru'
                                        ? 18.sp
                                        : 20.sp) *
                                    widget.ratio,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              lastChosenInstrument?.task[widget.languageCode] ??
                                  '',
                              style: TextStyle(
                                color: const Color(0xFF482319),
                                fontSize: (widget.languageCode == 'ru'
                                        ? 18.sp
                                        : 20.sp) *
                                    widget.ratio,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
