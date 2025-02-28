import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int type = 1;
  bool isLoading = false;
  TextEditingController _priceController = TextEditingController();
  double totalAmount = 20.50;
  double shippingFee = 0.00;
  double coffeePrice = 5.00;
  List<String> coffeeOptions = ["Small - \$2.00", "Medium - \$3.00", "Large - \$4.00"];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final double? receivedTotalAmount = ModalRoute.of(context)?.settings.arguments as double?;
    if (receivedTotalAmount != null) {
      setState(() {
        totalAmount = receivedTotalAmount;
      });
    }
  }

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
            "Your payment of \$${(totalAmount + shippingFee).toStringAsFixed(2)} has been processed successfully.",
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

      Future.delayed(Duration(seconds: 5), () {
        Navigator.pop(context);
      });
    });
  }

  void updateCoffeePrice(String selectedCoffee) {
    setState(() {
      if (selectedCoffee == "Small - \$2.00") {
        coffeePrice = 2.00;
      } else if (selectedCoffee == "Medium - \$3.00") {
        coffeePrice = 3.00;
      } else if (selectedCoffee == "Large - \$4.00") {
        coffeePrice = 4.00;
      }
      totalAmount = coffeePrice + shippingFee;
    });
  }

  void updateCustomPrice(String value) {
    setState(() {
      totalAmount = double.tryParse(value) ?? coffeePrice + shippingFee;
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
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 20),
                buildPaymentOption(1, "Bitcoin", Icons.currency_bitcoin_outlined),
                buildPaymentOption(2, "ABA Bank", Icons.comment_bank),
                buildPaymentOption(3, "Acleda Bank", Icons.account_balance),
                buildPaymentOption(4, "Credit Card", Icons.add_card),
                SizedBox(height: 10),

                // Coffee Size Selection
                Text("Choose Your Coffee Size", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                SizedBox(height: 5),
                DropdownButton<String>(
                  value: coffeeOptions.firstWhere(
                        (option) => option.contains("\$${coffeePrice.toString()}"),
                    orElse: () => coffeeOptions.first,
                  ),
                  onChanged: (value) {
                    if (value != null) {
                      updateCoffeePrice(value);
                    }
                  },
                  items: coffeeOptions.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(value: value, child: Text(value));
                  }).toList(),
                ),
                SizedBox(height: 20),

                // Custom Price Input
                Container(
                  height: 60,
                  child: TextField(
                    controller: _priceController,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(
                      labelText: 'Enter Custom Price',
                      hintText: 'Enter custom price',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.attach_money),
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    ),
                    maxLines: 1,
                    onChanged: updateCustomPrice,
                  ),
                ),
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
      ),
    );
  }

  Widget _buildPriceSummary() {
    return Column(
      children: [
        _buildPriceRow("Sub_Total", "\$${totalAmount.toStringAsFixed(2)}", Colors.redAccent),
        _buildPriceRow("Shipping Fee", "\$${shippingFee.toStringAsFixed(2)}", Colors.grey),
        Divider(color: Colors.black87),
        _buildPriceRow("Total Payment", "\$${(totalAmount + shippingFee).toStringAsFixed(2)}", Colors.green),
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
