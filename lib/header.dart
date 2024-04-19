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

  void _sendEmail() {
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

  final List<Map<String, String>> contactIcons = [
    {
      "icon": "assets/icons/email.svg",
      "url": "mailto:ahmad.hessi.96@gmail.com"
    },
    {
      "icon": "assets/icons/linked-in.svg",
      "url": "https://linkedin.com/in/ahmad-hossi",
    },
    {
      "icon": "assets/icons/calender.svg",
      "url": "https://calendly.com/d/cp44-pjf-zs4",
    },
    {
      "icon": "assets/icons/github.svg",
      "url": "https://github.com/ahmad-hossi",
    },
    {
      "icon": "assets/icons/x.svg",
      "url": "https://twitter.com/AHMED_HOSSI",
    },
    {
      "icon": "assets/icons/medium.svg",
      "url": "https://medium.com/@ahmad.hossi",
    },
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
            const Spacer(
              flex: 3,
            ),
            ...List.generate(
              contactIcons.length,
              (index) => InkWell(
                onTap: () async {
                  await launchUrl(Uri.parse(contactIcons[index]["url"]!));
                },
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: Colors.lightBlue,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  margin: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(contactIcons[index]["icon"]!),
                ),
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
