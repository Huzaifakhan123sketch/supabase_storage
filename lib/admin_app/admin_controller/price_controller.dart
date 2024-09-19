import 'package:get/get.dart';

class PriceController extends GetxController{

  var price = 0.0.obs;

  incrementPrice (double value){
    price.value = value;
    value++;
  }
   decrementPrice (double decValue){
  price.value = decValue;
  decValue--;
  }
   doublePrice (double dovalue){
    price.value = dovalue;
    dovalue * price.toDouble();
  }

}