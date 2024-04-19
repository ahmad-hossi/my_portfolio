import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SkillCard extends StatelessWidget {
  final String imagePath;
  final String skillName;

  const SkillCard({
    super.key,
    required this.imagePath,
    required this.skillName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: const Color.fromARGB(255, 100, 99, 99),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: const Color.fromARGB(255, 0, 0, 0),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 75,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                imagePath,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(4, 8, 16, 8),
            child: Text(
              skillName,
              style: GoogleFonts.openSans(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
