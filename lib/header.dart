import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class Header extends StatelessWidget {
  Header({
    required this.selectedSectionIndex,
    required this.onHeaderTap,
    required this.onHeaderMenuTap,
    super.key,
  });

  final void Function(int) onHeaderTap;
  final void Function() onHeaderMenuTap;
  final ValueNotifier<int> selectedSectionIndex;


  void _sendEmail(){
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'ahmad.hessi.96@gmail.com',
      // queryParameters: {
      //   'subject': '',
      //   'body': ''
      // },
    );
    launchUrl(emailLaunchUri);
  }

  final List<String> headerTitles = [
    'Home',
    'Skills',
    'Experience',
    'Contact me',
  ];

  final List<String> contactIcons = [
    "assets/icons/email.svg",
    "assets/icons/linked-in.svg",
    "assets/icons/calender.svg",
    "assets/icons/github.svg",
    "assets/icons/x.svg",
    "assets/icons/medium.svg"
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: 60,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent,
            blurRadius: 10,
            blurStyle: BlurStyle.outer,
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(
            children: [
              SizedBox(width: 8),
              Text(
                'somthing',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          40.horizontalSpace,
          const VerticalDivider(),
          const Spacer(),
          if (screenWidth > 750) ...{
            ...List.generate(
              headerTitles.length,
              (index) => MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () {
                    onHeaderTap(index);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    child: AnimatedBuilder(
                      animation: selectedSectionIndex,
                      builder: (context, _) => Text(
                        headerTitles[index],
                        style: TextStyle(
                          color: selectedSectionIndex.value == index
                              ? Colors.blue
                              : Colors.black,
                          fontSize: 16,
                          fontWeight: selectedSectionIndex.value == index
                              ? FontWeight.w600
                              : FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(flex: 3,),
            ...List.generate(
              contactIcons.length,
              (index) => Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: Colors.lightBlue,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.all(4.0),
                child: SvgPicture.asset(contactIcons[index]),
              ),
            ),
            const Spacer(),
            const VerticalDivider(),
            40.horizontalSpace,
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.r),
              )),
              onPressed: _sendEmail,
              child: const Text(
                "Hire me",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                ),
              ),
            )
          } else ...{
            const Spacer(),
            InkWell(
              onTap: onHeaderMenuTap,
              child: SizedBox(
                height: 32,
                width: 32,
                child: SvgPicture.asset('assets/icons/main.svg'),
              ),
            ),
          }
        ],
      ),
    );
  }
}
