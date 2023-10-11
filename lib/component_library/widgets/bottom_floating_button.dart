import 'package:flutter/material.dart';

class BottomFloatingButton extends StatelessWidget {
  const BottomFloatingButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Container(
          width: 220,
          height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              colors: [
                Color(0xFFD3D241),
                Color(0xFF6DB84C),
              ],
            ),
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                vertical: 12,
              ),
              child: Row(
                children: [
                  const Icon(Icons.add),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(label),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
