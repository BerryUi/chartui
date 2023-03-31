import 'package:flutter/material.dart';
import 'package:chartui/chartui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ChartUi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'ChartUI Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class SBarChartItem {
    String label;
    List<double> value;
    //  Color? barColor
    SBarChartItem({
      required this.label,
      required this.value
      });
}

class ScaterrDat {
   double x;
   double y;
   ScaterrDat({
    required this.x,
    required this.y
   });
}

class Bubble {
   double x;
   double y;
   double z;
   Bubble({
    required this.x,
    required this.y,
    required this.z
   });
}

class Data {
   String label;
   double value;
   Data({
    required this.label,
    required this.value
    });
}

class _MyHomePageState extends State<MyHomePage> {

  List<Data> barData = [
      Data(label:"Vegeies", value:845),
      Data(label:"food", value:290),
      Data(label:"Grocessory", value:990),
      Data(label:"Menu", value:545),
      Data(label:"Vegeies", value:845),
      Data(label:"food", value:545),
      Data(label:"food", value:745),
      Data(label:"food", value:545),
      Data(label:"food", value:500),
      Data(label:"food", value:890),
  ];

  List<Data> columnData = [
      Data(label:"a", value:845),
      Data(label:"f", value:290),
      Data(label:"G", value:1190),
      Data(label:"m", value:545),
      Data(label:"V", value:1287),
      Data(label:"b", value:545),
      Data(label:"c", value:745),
      // Data(label:"d", value:545),
      // Data(label:"e", value:500),
      Data(label:"f", value:890),
  ];

  List<ScaterrDat> dataScatter = [
         ScaterrDat(x:10, y:80),
         ScaterrDat(x:40, y:90),
         ScaterrDat(x:45, y:75),
         ScaterrDat(x:50, y:85),
         ScaterrDat(x:65, y:60),
         ScaterrDat(x:42, y:120),
         ScaterrDat(x:150, y:65),
         ScaterrDat(x:36, y:90),

    ];

  List<Bubble> dataBubble = [
         Bubble(x:10, y:80,z:5),
         Bubble(x:40, y:90,z: 6),
         Bubble(x:45, y:75,z: 7),
         Bubble(x:50, y:85,z: 4),
         Bubble(x:65, y:60,z: 5),
         Bubble(x:42, y:120,z: 8),
         Bubble(x:150, y:65,z: 6),
         Bubble(x:36, y:90,z: 3),
         Bubble(x:130, y:95,z: 10),
         Bubble(x:135, y:75,z: 9),

    ];
    
  

  List<SBarChartItem> listData =[
      SBarChartItem(label:"Veg", value:[845,500]),
      SBarChartItem(label:"food", value:[800,600]),
      SBarChartItem(label:"Groc", value:[990,200]),
      SBarChartItem(label:"Menu", value:[545,450]),
      SBarChartItem(label:"soup", value:[845,400]),
      SBarChartItem(label:"food", value:[545,300]),
      SBarChartItem(label:"food", value:[545,100]),
      SBarChartItem(label:"food", value:[500,200]),
      SBarChartItem(label:"food", value:[890,400]),
    ];



  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(title: const Text("ChartUi"),),
      body: SingleChildScrollView(
        child: Column( crossAxisAlignment: CrossAxisAlignment.center, children: [
          
            PieChart(dataset:[
                PieChartItem( label:"Comedy", value:0.2),
                PieChartItem( label:"Action", value:0.25),
                PieChartItem( label:"Romance", value:0.3),
                PieChartItem( label:"Drama", value:0.05),
                PieChartItem( label:"Scifi", value:0.2),
                PieChartItem(value: 0.5, label:"Mystery"),
                PieChartItem(value: 0.25, label:"MysteryFitted")
              ],
              width: 300,
              height: 300,
              strokeWidth:2,
              strokeColor:Colors.blueAccent,
              animation:ChartAnimation.rounded,
              labelStyle:const TextStyle(color: Colors.black,fontSize: 60)
            ),
      
            DoughnutChart(
              centerRadius:80,
              dividerWidth:2,
              dividerColor:Colors.black,
              centerColor:Colors.white,
              height:300,
              width:300,
              listColor:const [
                Colors.blue,
                Colors.pink,
                Colors.yellow,
                Colors.redAccent,
                Colors.greenAccent
              ],
              dataset : [
                DoughnutItem(
                   value:10,
                   label:"name"
                ),
                DoughnutItem(
                   value:10,
                   label:"name"
                ),
                DoughnutItem(
                   value:20,
                   label:"name"
                ),
                DoughnutItem(
                   value:20,
                   label:"Divyamverma__thattest"
                ),
              ]
            ),
            
            ScatterChart(
               height:650,
               width:400,
               x:dataScatter.map((e) => e.x).toList(),
               y:dataScatter.map((e) => e.y).toList(),
               dotColor:Colors.red.shade300,   //Optional
               axisLabelStyle:const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),  //Optional 
               axisColor:Colors.blueAccent, //Optional
               padding:const EdgeInsets.only(top: 100,left: 20,right: 20),  //Optional
               
            ),
            
            BubbleChart(
             height:650,
             width:400,
             x:dataBubble.map((e) => e.x).toList(),
             y:dataBubble.map((e) => e.y).toList(),
             z:dataBubble.map((e) => e.z).toList(),
             dotColor:Colors.red.shade300,   //Optional
             axisLabelStyle:const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),  //Optional 
             axisColor:Colors.blueAccent, //Optional
             padding:const EdgeInsets.only(top: 100,left: 20,right: 20),  //Optional 
             
          ),

            Barchart(
              height:600,
              width:360,
              x:barData.map((e) =>e.value).toList(),
              y:barData.map((e) => e.label).toList()
            ),
            
            StackedBarChart(
              height:600,
              width:350,
              x:listData.map((e) =>e.value).toList(),
              y:listData.map((e) => e.label).toList()
            ),
            
            ColumnChart(
              height:600,
              width:350,
              y:columnData.map((e) =>e.value).toList(),
              x:columnData.map((e) => e.label).toList()
            ),

            Linearchart(
              xAxisData:columnData.map((e) =>e.label).toList(),
              yAxisData:columnData.map((e) =>e.value).toList()
            ),
            
            AreaChart(
              xAxisData:columnData.map((e) =>e.label).toList(),
              yAxisData:columnData.map((e) =>e.value).toList()
            ),
            
            StackedAreaChart(
              yNestedData:listData.map((e) =>e.value).toList(),
              xAxisData:listData.map((e) =>e.label).toList(),
              height:600,
              width:350
            ),
            
            StackedLineChart(
              yNestedData:listData.map((e) =>e.value).toList(),
              xAxisData:listData.map((e) =>e.label).toList(),
              height:600,
              width:350
            ),
            
          ],
        ),
      )
     );
  }
}