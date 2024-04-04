import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    alignment: Alignment.center,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(100)),
                    child:
                        Text(((data['question_index'] as int) + 1).toString(),
                            style: GoogleFonts.lato(
                              backgroundColor: (data['user_answer'] ==
                                      data['correct_answer'])
                                  ? const Color.fromARGB(255, 7, 202, 43)
                                  : const Color.fromARGB(255, 202, 72, 7),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            )),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 7, 202, 163),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['user_answer'] as String,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.lato(
                              color: const Color.fromARGB(255, 195, 160, 194),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(data['correct_answer'] as String,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.lato(
                              color: const Color.fromRGBO(151, 132, 245, 1),
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
