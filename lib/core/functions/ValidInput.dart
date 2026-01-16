
import 'package:get/get.dart';

validInput ( String val,int min,int max,String type){

  if(val.isEmpty){
    return "This field is required";
  }

  if(type=='firstName'){
    if(!GetUtils.isUsername(val)){
      return "Invalid User Name";
    }
  }

  if(type=='lastName'){
    if(!GetUtils.isUsername(val)){
      return "Invalid User Name";
    }
  }

  if(type=='phone'){
    if(!GetUtils.isPhoneNumber(val)){
      return "Invalid Phon Number";
    }
  }

  if(type=='area'){
    if(!GetUtils.isTxt(val)){
      return "Invalid Area";
    }
  }

  if(type=='space'){
    if(!GetUtils.isNum(val)){
      return "Invalid Space";
    }
  }

  if(type=='price'){
    if(!GetUtils.isNum(val)){
      return "Invalid Price";
    }
  }

  if(val.length<min){
    return "The field must be larger than $min characters";
  }

  if(val.length>max){
    return "The field must be smaller than $max characters";
  }
  return null;
}