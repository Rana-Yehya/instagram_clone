import 'package:flutter/material.dart';
import 'package:instagram_clone/core/themes/size_config.dart';

class SavingPage extends StatelessWidget {
  final bool isSaving;
  final String text;

  const SavingPage({super.key, required this.isSaving, required this.text});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: !isSaving,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 10),
        color: isSaving ? Colors.black.withOpacity(0.5) : Colors.transparent,
        height: SizeConfig.height!,
        width: SizeConfig.width!,
        child: Visibility(
          visible: isSaving,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              SizedBox(height: SizeConfig.height! * 0.01),
              Text(
                text,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: Colors.white,
                      fontSize: 16,
                    ),
              ),
            ],
          ),
        ),
      
      ),
    );
  }
}
