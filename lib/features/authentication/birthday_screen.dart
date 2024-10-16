import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

class BirthDayScreen extends StatefulWidget {
  const BirthDayScreen({super.key});

  @override
  State<BirthDayScreen> createState() => _BirthDayScreenState();
}

class _BirthDayScreenState extends State<BirthDayScreen> {
  final TextEditingController _birthdayController = TextEditingController();
  DateTime initailDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _setTextFieldDate(initailDate);
  }

  @override
  void dispose() {
    _birthdayController.dispose();
    super.dispose();
  }

  void _onNextTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),
      ),
    );
  }

  void _setTextFieldDate(DateTime date) {
    final textDate = date.toString().split(" ").first;
    _birthdayController.value = TextEditingValue(text: textDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
        backgroundColor: Colors.white, // 흰색 배경 적용
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size36),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            const Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "When's your birthday?",
                      style: TextStyle(
                        fontSize: Sizes.size24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Gaps.v8,
                    Text(
                      "Your birthday won't be shown publicy.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Gaps.v16,
            TextField(
              controller: _birthdayController,
              readOnly: true,
              autocorrect: false,
              cursorColor: Theme.of(context).primaryColor,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade500),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade500,
                  ),
                ),
              ),
            ),
            Gaps.v16,
            GestureDetector(
              onTap: _onNextTap,
              child: const FormButton(disabled: false),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 500,
        color: Colors.white,
        child: CupertinoDatePicker(
          maximumDate: initailDate,
          initialDateTime: initailDate,
          onDateTimeChanged: _setTextFieldDate,
          mode: CupertinoDatePickerMode.date,
        ),
      ),
    );
  }
}
