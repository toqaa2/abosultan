
import 'package:abosultan/core/utils/app_imports.dart';
import 'package:easy_localization/easy_localization.dart';

class ChangeLanguageButton extends StatefulWidget {
  const ChangeLanguageButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  State<ChangeLanguageButton> createState() => _ChangeLanguageButtonState();
}

class _ChangeLanguageButtonState extends State<ChangeLanguageButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: widget.onTap,
        child: Text(context.locale.toString() == 'ar' ? 'en' : 'ع'));
  }
}
