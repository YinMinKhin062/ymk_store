
import '../constants/enum.dart';

class PriceCalculator {
  static double calculateTotalPrice(double productPrice, String location) {
    double taxamount = productPrice*getTaxRate();
    double shippingFee = shippingFeeCalculator(location);
    double totalPrice = productPrice + shippingFee + taxamount;
    return totalPrice;
  }

  static double getTaxRate(){
    return 0.005;
  }

  static double getTaxAmount(productPrice){
    return productPrice*getTaxRate();
  }

  static double shippingFeeCalculator(String location) {
    switch (location) {
      case "ShippingTownships.yangon":
        return 1;
      case "ShippingTownships.mandalay":
        return 1.5;
      case "ShippingTownships.chin":
        return 2;
      case "ShippingTownships.naypyitaw":
        return 1.5;
      case "ShippingTownships.bago":
        return 1.5;
      case "ShippingTownships.mon":
        return 1.5;
      case "ShippingTownships.ayeyarwaddy":
        return 1.5;
      case "ShippingTownships.sagaing":
        return 1.5;
      case "ShippingTownships.kayin":
        return 1.5;
      case "ShippingTownships.kachin":
        return 2.5;
      case "ShippingTownships.magway":
        return 1.5;
      case "ShippingTownships.shan":
        return 1.5;
      case "ShippingTownships.tanintharyi":
        return 2.5;
      case "ShippingTownships.rakhine":
        return 2.5;
      case "ShippingTownships.busstation":
        return .5;
      default:
        return 0;
    }
  }
}
