import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_portfolio/constant.dart';
import 'package:url_launcher/url_launcher.dart';

import 'header.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1280, 720),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ahmad Al-Hossi',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final ValueNotifier<int> selectedSection = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Header(
            selectedSectionIndex: selectedSection,
            onHeaderTap: (int) {},
            onHeaderMenuTap: () {},
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(top: 12.h),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(width: 100),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 150,
                            ),
                            SizedBox(
                              width: 700,
                              child: DefaultTextStyle(
                                style: const TextStyle(
                                    fontSize: 60.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Agne',
                                    color: Colors.black),
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    TypewriterAnimatedText(
                                        'Hi! I\'m Ahmad Al-Hossi'),
                                  ],
                                  onTap: () {},
                                ),
                              ),
                            ),
                            10.verticalSpace,
                            SizedBox(
                              child: DefaultTextStyle(
                                style: const TextStyle(
                                    fontSize: 40.0,
                                    fontFamily: 'Agne',
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w600),
                                child: AnimatedTextKit(
                                  animatedTexts: [
                                    TypewriterAnimatedText('Flutter Developer'),
                                  ],
                                  onTap: () {},
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            SizedBox(
                              width: 500.w,
                              child: Text(
                                "Mobile Software Engineer with deep understanding in"
                                " Flutter, Dart and Firebase with 3 years experience"
                                ".\nEvery day is a new build, So let's start your own",
                                style: GoogleFonts.abel(
                                  textStyle : const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                )
                              ),
                            ),
                            60.verticalSpace,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 50.h,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      await launchUrl(Uri.https(
                                          "drive.google.com",
                                          AppConstant.resumeUrl));
                                    },
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.r),
                                      ),
                                    ),
                                    child: const Text(
                                      'Download Resume',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                  height: 50.h,
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        await launchUrl(Uri.https(
                                            "calendly.com","/d/cp44-pjf-zs4"));
                                      },
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(6.r),
                                      )),
                                      child: const Text(
                                        'Make an appointment',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      )),
                                ),
                                Spacer(),
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Image.asset(
                          'assets/images/profile.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
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
