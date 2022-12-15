import 'package:flutter/services.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class StripeTransactionResponse {
  String message;
  PaymentIntentResult paymentIntentResult;
  bool success;

  StripeTransactionResponse({this.message, this.success, this.paymentIntentResult});
}

class StripeService {
  static String apiBase = 'https://api.stripe.com/v1';
  static String paymentAPIURL = '${apiBase}/payment_intents';
  static String secret =
      'sk_test_51Htry6B4rmQkhb2Kj9UUg4uC1F4PzBECgbABcwFr0XkIIJEnxVnkNmBnYdZretWKnQRZctgm2qMdd0HUnmcmEHeL00lzdMpvjM';
  static Map<String, String> headers = {
    'Authorization': 'Bearer $secret',
    'Content-Type': 'application/x-www-form-urlencoded'
  };
  static init() {
    StripePayment.setOptions(StripeOptions(
        publishableKey:
        "pk_test_51Hy7VlJHoa5PMDBJ39tsxgB2xrQg0tbWvxmF3yPJ4KZxRsbrkVhEIk5dARcog1RJIS4xEa8qHbcna5l9pAVr9W3u00EGdwhFtP",
        merchantId: "Test",
        androidPayMode: 'test'));
  }

  static Future<StripeTransactionResponse> payViaExisitingCard({String amount, String currency, card}) async {
    try {
      var paymentMethond = await StripePayment.createPaymentMethod(PaymentMethodRequest(
        card: card,
      ));
      var paymentIntent =
      await StripeService.createPaymentIntent(amount, currency);
      var response = await StripePayment.confirmPaymentIntent(PaymentIntent(
          clientSecret: paymentIntent['client_secret'],
          paymentMethodId: paymentMethond.id));
      //print(jsonEncode(paymentIntent));
      print(response.status);
      if(response.status == 'succeeded') {
        return new StripeTransactionResponse(
            message: 'Transaction of ${amount} succesful', success: true);
      } else {
        return new StripeTransactionResponse(
            message: 'Transaction failed', success: false);
      }
    }
    on PlatformException catch (err) {
      return getPlatformExceptionResult(err);
    }
    catch (err) {
      return new StripeTransactionResponse(
          message: 'Transaction failed: ${err.toString()}', success: false);
    }
  }

  PaymentIntentResult _intentResult;

  void setIntentResult(PaymentIntentResult result) {
    result = _intentResult;
  }

  static Future<StripeTransactionResponse> payWithNewCard(
      {String amount, String clientSecret}) async {
    try {
      var paymentMethod = await StripePayment.paymentRequestWithCardForm(
          CardFormPaymentRequest());
      //var paymentIntent =
      //await StripeService.createPaymentIntent(amount, currency);
      var response = await StripePayment.confirmPaymentIntent(PaymentIntent(
          clientSecret: clientSecret,
          paymentMethodId: paymentMethod.id));
      //print(jsonEncode(paymentIntent));
      print("response: status ${response.status}");
      print(response.toString());
      print(response.paymentIntentId.toString());
      if(response.status == 'requires_capture') {
        print("striep : ${response.paymentMethodId}");
        //setIntentResult(response);
        return new StripeTransactionResponse(
            message: 'Transaction of ${amount} succesful', success: true, paymentIntentResult: response);
      } else {
        return new StripeTransactionResponse(
            message: 'Transaction failed', success: false);
      }
    }
    on PlatformException catch (err) {
      return getPlatformExceptionResult(err);
    }
    catch (err) {
      return new StripeTransactionResponse(
          message: 'Transaction failed: ${err.toString()}', success: false);
    }
  }

  static getPlatformExceptionResult(err) {
    String message = "Something went wrong";
    if (err.code == 'cancelled') {
      message = "Transaction cancelled";
    }

    return new StripeTransactionResponse(
        success: false,
        message: message
    );
  }

  static Future<Map<String, dynamic>> createPaymentIntent(
      String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'description' : 'goods and services',

        'currency': currency,
        'receipt_email' : "adarsh.manoj@a3jm.com",
        'payment_method_types[]': 'card'
      };
      print(StripeService.headers);
      var response = await http.post(paymentAPIURL,
          body: body, headers: StripeService.headers);
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
    return null;
  }
}
