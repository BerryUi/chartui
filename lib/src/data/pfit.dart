// ignore: filenames
// ignore_for_file: file_names
import 'package:chartui/chart_item.dart';
import 'package:chartui/chartui.dart';

class DataFitting {
   double fitScale = 1;
   double dnew = 0;

   List<PieChartItem> dataFitting({required List<PieChartItem> dataList}){
       double total = 0;
       dnew =0;
       for (var element in dataList) {
          total+=element.value;
       }
       
       for (var element in dataList) {
         element.value = element.value * 1/total;
         dnew+=element.value;
       }
       return dataList;
   }
  
}

class DoughNutFit {
   List<DoughnutItem> listData;
   DoughNutFit({
    required this.listData
   });
   double newD = 0;
   List<DoughnutItem> fit(){
       double total = 0;
       newD=0;
       for (var element in listData) {
          total+=element.value;
       }
       for (var element in listData) {
         element.value = element.value * 1/total;
         newD+=element.value;
       }
       return listData;
   }


}