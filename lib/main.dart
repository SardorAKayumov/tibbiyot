import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'inactivity_wrapper.dart';
import 'locale_provider.dart';
import 'view/in_game.dart';
import 'view/menu.dart';
import 'view/victory.dart';
import 'widgets/bottom.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);
  // Hide all system UI for full immersive experience
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(
    ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int step = 1;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Tisa Sans Pro'),
          home: InactivityWrapper(
            onTimeout: () {
              setState(() {
                step = 1;
              });
            },
            child: Consumer<LocaleProvider>(
              builder: (context, localeProvider, child) {
                final gameWidth = (MediaQuery.of(context).size.height / 9) * 16;
                final widthDiff = gameWidth / 1920.w;
                return Scaffold(
                  backgroundColor: Colors.black,
                  body: Center(
                    child: SizedBox(
                      width: gameWidth,
                      height: MediaQuery.of(context).size.height,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Image.asset(
                            'assets/bg.jpg',
                            fit: BoxFit.contain,
                          ),
                          if (step == 1)
                            Positioned(
                              left: 960.w * widthDiff,
                              child: MenuView(
                                onStart: () {
                                  setState(() {
                                    step = 2;
                                  });
                                },
                                languageCode: localeProvider.locale.languageCode,
                                widthDiff: widthDiff,
                              ),
                            ),
                          if (step == 2) ...[
                            Container(
                              width: double.infinity,
                              height: double.infinity,
                              color: Colors.black.withOpacity(0.2),
                            ),
                            Positioned(
                              right: 165.w * widthDiff,
                              child: InGameView(
                                languageCode: localeProvider.locale.languageCode,
                                ratio: widthDiff,
                                onVictory: () {
                                  setState(() {
                                    step = 3;
                                  });
                                },
                              ),
                            ),
                          ],
                          if (step == 3)
                            Positioned(
                              right: 188.w * widthDiff,
                              child: VictoryView(
                                languageCode: localeProvider.locale.languageCode,
                                ratio: widthDiff,
                                onPlayAgain: () {
                                  setState(() {
                                    step = 2;
                                  });
                                },
                                onHome: () {
                                  setState(() {
                                    step = 1;
                                  });
                                },
                              ),
                            ),
                          Positioned(
                            bottom: 40.h,
                            left: 960.w * widthDiff,
                            child: BottomWidget(
                              onBack: () {
                                setState(() {
                                  step = 1;
                                });
                              },
                              onZoomIn: () {},
                              onHome: () {
                                setState(() {
                                  step = 1;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
