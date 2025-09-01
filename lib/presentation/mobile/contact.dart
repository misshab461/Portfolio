import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/application/bloc/firebase_bloc.dart';
import 'package:portfolio/models/user.dart';
import 'package:portfolio/presentation/web/contact.dart';
import 'package:portfolio/presentation/web/top_section.dart';
import 'package:portfolio/widgets/slade.dart';
import 'package:portfolio/widgets/text.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMobile extends StatelessWidget {
  ContactMobile({super.key});
  final nameCr = TextEditingController();
  final emailCr = TextEditingController();
  final subjectCr = TextEditingController();
  final messageCr = TextEditingController();
  final icons = [
    'asset/github.png',
    'asset/linkedin.png',
    'asset/facebook.png',
    'asset/instagram.png',
    'asset/whatsapp.png',
  ];
  final _key = GlobalKey<FormState>();

  final url = [
    'https://github.com/misshab461?tab=repositories',
    'https://www.linkedin.com/in/misshabk/',
    'https://facebook.com/michuuzz.michu',
    'https://instagram.com/misshub_?igsh=MXdteTBzM3M5eTJubQ==',
    'https://wa.me/919526013415?text=Hello%20Misshab%20👋🏻!',
  ];
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Container(
        width: double.infinity,
        color: const Color(0xFFF8F5F2), // light background

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: SizedBox(
            child: Column(
              children: [
                SecType(
                  text: 'Get In Touch.',
                  number: '03',
                  numS: 150,
                  textS: 25,
                ),
                CsText(
                  text: "Let's Talk.",
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.alumniSans().fontFamily,
                  color: Color(0xFF8B4513), // brown
                ),
                const SizedBox(height: 16),
                const Text(
                  "I'd like to hear from you!",
                  style: TextStyle(fontSize: 18, color: Colors.black87),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Whether you’re looking to collaborate, discuss a project, or simply connect, please drop me a message. I’ll get back to you as soon as possible.",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 32),

                // Email
                Row(
                  children: const [
                    Icon(CupertinoIcons.mail, size: 20, color: Colors.black54),
                    SizedBox(width: 8),
                    CsText(
                      text:
                          "misshabk461@gmail.com\naqliontechnologies@gmail.com",
                      fontSize: 14,
                      overflow: TextOverflow.visible,
                      maxLines: 2,
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
                  decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // First + Last Name
                      Row(
                        children: [
                          Expanded(
                            child: CsField(
                              controller: nameCr,
                              label: "Name",
                              validatorMessage: 'Please enter your name',
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: CsField(
                              controller: emailCr,
                              label: "Email",
                              validatorMessage: 'Please enter your email',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Email
                      CsField(
                        controller: subjectCr,
                        label: "Subject",
                        validatorMessage: 'Please enter subject',
                      ),
                      const SizedBox(height: 16),

                      // Message
                      CsField(
                        controller: messageCr,
                        label: "Message",
                        maxLines: 5,
                        validatorMessage: 'Please enter your message',
                      ),
                      const SizedBox(height: 20),

                      // Send Button
                      Align(
                        alignment: Alignment.centerRight,
                        child: BlocConsumer<FirebaseBloc, FirebaseState>(
                          listener: (context, state) {
                            if (state is FirebaseSuccess) {
                              Fluttertoast.showToast(
                                msg: 'Your message has been sent successfully',
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 2,
                                webBgColor: "#808080",
                                webPosition: "right",
                                textColor: Colors.black,
                                webShowClose: true,
                              );
                            } else if (state is FirebaseError) {
                              Fluttertoast.showToast(
                                msg: state.errorMessage,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 2,
                                webBgColor: "#808080",
                                webPosition: "right",
                                textColor: Colors.black,
                                webShowClose: true,
                              );
                            }
                          },
                          builder: (context, state) {
                            if (state is FirebaseLoading) {
                              return const Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  color: Colors.black,
                                ),
                              );
                            }
                            return AnimatedButton(
                              text: 'Reach Out',
                              color: Colors.grey,
                              colortext: Colors.black,
                              onTap: () async {
                                if (_key.currentState!.validate()) {
                                  final userMessage = UserMessage(
                                    name: nameCr.text,
                                    email: emailCr.text,
                                    subject: subjectCr.text,
                                    message: messageCr.text,
                                  );
                                  // clear form
                                  context.read<FirebaseBloc>().add(
                                    MessageButtonPressed(message: userMessage),
                                  );
                                  nameCr.clear();
                                  emailCr.clear();
                                  subjectCr.clear();
                                  messageCr.clear();
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
