import 'package:flutter/material.dart';

class MyMoneyStatus extends StatelessWidget {
  final double currentMoney;
  const MyMoneyStatus({super.key, required this.currentMoney});

  @override
  Widget build(BuildContext context) {
    String message;
    Color statusColor;

    if (currentMoney == 0) {
      message = 'I am poor';
      statusColor = Color(0xffff1605);
    } else if (currentMoney < 5) {
      message = 'I have a bit money';
      statusColor = Color(0xff84140c);
    } else if (currentMoney >= 5 && currentMoney < 10) {
      message = 'I have some money';
      statusColor = Color(0xffcb7c07);
    } else if (currentMoney >= 10 && currentMoney < 15) {
      message = 'I have a lot of money';
      statusColor = Color(0xff2c8e2f);
    } else {
      message = 'I am a millionaire girl';
      statusColor = Color(0xff83d73d);
    }

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Colors.white,
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(Icons.monetization_on, color: statusColor, size: 28),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
            ),
            Text(
              currentMoney.toStringAsFixed(0),
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: statusColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
