import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isMobile = constraints.maxWidth < 600;

        return Container(
          width: double.infinity,
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Dashboard',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Expanded(
                          child: Text(
                            "Welcome back, Salah Uddin",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 12),
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Color(0xFFD8E9F5),
                        )
                      ],
                    )
                  ],
                )
              : Row(
                  children: [
                    const Text(
                      'Dashboard',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 24),
                    Row(
                      children: const [
                        _TopBarButton(label: 'Stock'),
                        SizedBox(width: 12),
                        _TopBarButton(label: 'Order'),
                        SizedBox(width: 12),
                        _TopBarButton(label: 'Invoice'),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: const [
                        Text("Welcome back,", style: TextStyle(fontSize: 12)),
                        SizedBox(width: 4),
                        Text("Salah Uddin", style: TextStyle(fontWeight: FontWeight.w600)),
                        SizedBox(width: 8),
                        CircleAvatar(
                          radius: 16,
                          backgroundColor: Color(0xFFD8E9F5),
                        )
                      ],
                    )
                  ],
                ),
        );
      },
    );
  }
}

class _TopBarButton extends StatelessWidget {
  final String label;

  const _TopBarButton({required this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: const Size(50, 30),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () {},
      child: Text(label, style: const TextStyle(color: Colors.black87, fontSize: 13)),
    );
  }
}
