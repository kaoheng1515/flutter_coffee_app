
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int type = 1;
  bool isLoading = false;

  void handleRadio(Object? e) {
    setState(() {
      type = e as int;
    });
  }

  void confirmPayment() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });

      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Center(child: Text("🎉 Payment Successful🎉")),
          content: Text(
            "Your payment of \$20.50 has been processed successfully.",
            textAlign: TextAlign.center,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );

      // Auto-close the dialog after 3 seconds
      Future.delayed(Duration(seconds: 5), () {
        Navigator.pop(context);
      });
    });
  }

  Widget buildPaymentOption(int value, String text, IconData icon) {
    return GestureDetector(
      onTap: () => handleRadio(value),
      child: Container(
        width: double.infinity,
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          border: Border.all(
            width: type == value ? 1.5 : 0.5,
            color: type == value ? Colors.green : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          children: [
            Radio(
              value: value,
              groupValue: type,
              onChanged: handleRadio,
              activeColor: Colors.green,
            ),
            Icon(icon, color: type == value ? Colors.green[700] : Colors.grey),
            SizedBox(width: 10),
            Text(
              text,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: type == value ? Colors.black87 : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(

      appBar: AppBar(
        title: Text("Payment Method"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.green[900],
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 20),
              buildPaymentOption(1, "Bitcoin", Icons.currency_bitcoin_outlined),
              buildPaymentOption(2, "ABA Bank", Icons.comment_bank,),
              buildPaymentOption(3, "Acleda Bank", Icons.account_balance),
              buildPaymentOption(4, "Credit Card", Icons.add_card),
              SizedBox(height: 30),
              _buildPriceSummary(),
              SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: isLoading ? null : confirmPayment,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text("Confirm Payment", style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPriceSummary() {
    return Column(
      children: [
        _buildPriceRow("Sub_Total", "\$20.50", Colors.black87),
        _buildPriceRow("Shipping Fee", "\$0.00", Colors.grey),
        Divider(color: Colors.black87),
        _buildPriceRow("Total Payment", "\$20.50", Colors.red),
      ],
    );
  }

  Widget _buildPriceRow(String title, String price, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: color)),
          Text(price, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: color)),
        ],
      ),
    );
  }
}
