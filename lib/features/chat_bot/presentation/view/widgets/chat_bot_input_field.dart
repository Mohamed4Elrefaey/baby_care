import 'package:baby_care/core/extensions/extensions.dart';
import 'package:baby_care/core/utils/app_colors.dart';
import 'package:baby_care/core/utils/app_text_styles.dart';
import 'package:baby_care/features/chat_bot/presentation/view/widgets/chat_bot_input_button.dart';
import 'package:baby_care/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatBotInputField extends StatefulWidget {
  const ChatBotInputField({super.key, required this.onSend});
  final ValueChanged<String> onSend;

  @override
  State<ChatBotInputField> createState() => _ChatBotInputFieldState();
}

class _ChatBotInputFieldState extends State<ChatBotInputField> {
  final controller = TextEditingController();
  bool isEmpty = true;
  bool isTyping = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: _decoration(),
      child: Column(
        children: [
          TextField(
            controller: controller,

            onChanged: (v) => setState(() => isEmpty = v.isEmpty),
            onTap: () => setState(() => isTyping = true),
            decoration: InputDecoration(
              fillColor: Colors.transparent,
              hintText: S.of(context).howCanIHelp,
              hintStyle: AppTextStyles.body2Ragular.copyWith(
                color: AppColors.dText,
              ),
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
            ),
          ),
          8.height,
          Row(
            children: [
              ChatBotInputButton(
                color: isEmpty ? AppColors.dText : AppColors.primary,
                onTap: _send,
                child: const Icon(Icons.arrow_upward, color: Colors.white),
              ),
              const SizedBox(width: 8),
              ChatBotInputButton(
                color: Colors.white,
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: SvgPicture.asset('assets/svg/microphone.svg'),
                ),
              ),
              const Spacer(),
              ChatBotInputButton(
                color: Colors.white,
                onTap: () {},
                child: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      color: Color(0xffF0F0F0),
      borderRadius: BorderRadius.circular(16),
      border: Border.all(
        color: AppColors.primary.withOpacity(isTyping ? 1 : 0.17),
        width: 1.5,
      ),
      boxShadow: [
        BoxShadow(
          color: Color(0xFF000000).withOpacity(0.04),
          spreadRadius: 2,
          blurRadius: 4,
          offset: const Offset(0, 0),
        ),
        BoxShadow(
          color: Color(0xFF000000).withOpacity(0.04),
          spreadRadius: 2,
          blurRadius: 8,
          offset: const Offset(0, 6),
        ),
      ],
    );
  }

  void _send() {
    if (!isEmpty) {
      widget.onSend(controller.text);
      controller.clear();
      setState(() => isEmpty = true);
    }
  }
}
