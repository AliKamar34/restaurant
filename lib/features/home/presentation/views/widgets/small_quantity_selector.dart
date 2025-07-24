import 'dart:ui';

import 'package:flutter/material.dart';

class SmallBlurQuantitySelector extends StatefulWidget {
  final int initial;
  final Function(int) onChanged;

  const SmallBlurQuantitySelector({
    super.key,
    this.initial = 1,
    required this.onChanged,
  });

  @override
  State<SmallBlurQuantitySelector> createState() =>
      _SmallBlurQuantitySelectorState();
}

class _SmallBlurQuantitySelectorState extends State<SmallBlurQuantitySelector> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.initial;
  }

  void _change(int delta) {
    final newVal = quantity + delta;
    if (newVal >= 1) {
      setState(() => quantity = newVal);
      widget.onChanged(quantity);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          height: 32,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.white.withAlpha(30)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () => _change(-1),
                child: const Icon(Icons.remove, size: 16, color: Colors.white),
              ),
              const SizedBox(width: 8),
              Text(
                '$quantity',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              GestureDetector(
                onTap: () => _change(1),
                child: const Icon(Icons.add, size: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
