import 'package:flutter/material.dart';
import 'my_money_status.dart';
import 'my_house_depend.dart';

class MyStateless extends StatefulWidget {
  const MyStateless({super.key});

  @override
  State<MyStateless> createState() => _MyStatelessState();
}

class _MyStatelessState extends State<MyStateless> {
  double myMoney = 10;
  Color moneyColor = Colors.black;

  @override
  void initState() {
    super.initState();
    _calculateMoneyColor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // Current Money Display
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.account_balance_wallet,
                      size: 40, color: Colors.teal),
                  const SizedBox(width: 15),
                  Text(
                    'My Money Now:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    myMoney.toStringAsFixed(0),
                    style: TextStyle(
                      color: moneyColor,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '\$',
                    style: TextStyle(
                      color: moneyColor,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 25),

          // House Dependence
          MyHouseDependOnMyMoney(currentMoney: myMoney),
          const SizedBox(height: 30),

          // Money Status
          MyMoneyStatus(currentMoney: myMoney),
          const SizedBox(height: 20),

          // Action Buttons Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Withdraw Button
              ElevatedButton.icon(
                onPressed: () {
                  if (myMoney > 0) {
                    setState(() {
                      myMoney -= 1;
                      if (myMoney < 0) myMoney = 0;
                    });
                    _calculateMoneyColor();
                  }
                },
                icon: const Icon(Icons.remove_circle),
                label: const Text('Withdraw'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              // Deposit Button
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    myMoney += 1;
                  });
                  _calculateMoneyColor();
                },
                icon: const Icon(Icons.add_circle),
                label: const Text('Deposit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: myMoney == 0
                      ? Color(0xffff1605)
                      : myMoney < 5
                          ? Color(0xff84140c)
                          : myMoney < 10
                              ? Color(0xffcb7c07)
                              : myMoney < 15
                                  ? Color(0xff2c8e2f)
                                  : Color(0xff83d73d),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _calculateMoneyColor() {
    if (myMoney == 0) {
      moneyColor = Color(0xffff1605);
    } else if (myMoney < 5) {
      moneyColor = Color(0xff84140c);
    } else if (myMoney < 10) {
      moneyColor = Color(0xffcb7c07);
    } else if (myMoney < 15) {
      moneyColor = Color(0xff2c8e2f);
    } else {
      moneyColor = Color(0xff83d73d);
    }
  }
}
