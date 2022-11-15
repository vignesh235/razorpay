import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class payment extends StatefulWidget {
  const payment({super.key});

  @override
  State<payment> createState() => _paymentState();
}

class _paymentState extends State<payment> {
  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 150, left: 50),
        child: ElevatedButton(child: Text('Pay->'), onPressed: openCheckout),
      ),
    );
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_live_hBQP9dWRIpRDu1',
      'amount': 500, //in the smallest currency sub-unit.
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'timeout': 60, // in seconds
      'prefill': {
        'contact': '91231056789',
        'email': 'gaurav.kumar@example.com'
      },
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

void _handlePaymentSuccess(PaymentSuccessResponse response) {
  Fluttertoast.showToast(
      msg: "SUCCESS: ${response.paymentId}", timeInSecForIosWeb: 10);
}

void _handlePaymentError(PaymentFailureResponse response) {
  Fluttertoast.showToast(
      msg: "ERROR: ${response.code} - ${response.message}",
      timeInSecForIosWeb: 10);
}

void _handleExternalWallet(ExternalWalletResponse response) {
  Fluttertoast.showToast(
      msg: "EXTERNAL_WALLET: ${response.walletName}", timeInSecForIosWeb: 10);
}
