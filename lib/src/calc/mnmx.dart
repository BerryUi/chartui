class MinMax {
   var max = -double.maxFinite;
   var min = -double.maxFinite;

   double getMax({required List<double> list}){
    max = -double.maxFinite;
     for (var element in list) {
        // min = min>element.value ? element.value : min;
        max = max<element ? element : max;                                     //?? 30
     }
     return max;
   }
}





class NestedMinMax {
    List<double> maxfromValue = [];

    List<List<double>> nestedAxisData;

    NestedMinMax({
      required this.nestedAxisData
    });

    double maxs = 0;

    double get max=> maxs;
    List<double> get maxFromNested => maxfromValue;


    

    void calculate(){
        var max = -double.maxFinite;
        var maxLocal = -double.maxFinite;
        for (var element in nestedAxisData) {
          for (var elementDeep in element) {
            maxLocal = maxLocal<elementDeep ? elementDeep : maxLocal;
          }
          maxfromValue.add(maxLocal);
          maxLocal =-double.maxFinite;
        }

        for (var element in maxfromValue) {
          max = max<element ? element : max;
        }
        // return max;
    }

   
}