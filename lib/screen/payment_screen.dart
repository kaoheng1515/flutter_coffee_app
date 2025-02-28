import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  final double totalAmount;

  const PaymentScreen({super.key, required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Payment"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Total Amount: \$${totalAmount.toStringAsFixed(2)}", style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement payment logic here
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Payment Successful!")));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text("Pay Now", style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
