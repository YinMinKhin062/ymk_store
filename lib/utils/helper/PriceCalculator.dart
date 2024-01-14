
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
        return 2000;
      case "ShippingTownships.mandalay":
        return 4000.00;
      case "ShippingTownships.chin":
        return 8000.00;
      case "ShippingTownships.naypyitaw":
        return 4000.00;
      case "ShippingTownships.bago":
        return 4000.00;
      case "ShippingTownships.mon":
        return 4000.00;
      case "ShippingTownships.ayeyarwaddy":
        return 4000.00;
      case "ShippingTownships.sagaing":
        return 4000.00;
      case "ShippingTownships.kayin":
        return 4000.00;
      case "ShippingTownships.kachin":
        return 5500.00;
      case "ShippingTownships.magway":
        return 4000.00;
      case "ShippingTownships.shan":
        return 4000.00;
      case "ShippingTownships.tanintharyi":
        return 5500.00;
      case "ShippingTownships.rakhine":
        return 5500.00;
      case "ShippingTownships.busstation":
        return 1000.00;
      default:
        return 0;
    }
  }
}
