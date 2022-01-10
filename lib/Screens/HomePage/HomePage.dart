import 'package:bmicalculator/Helper/bmiInstance.dart';
import 'package:bmicalculator/Screens/ReportPage/ReportPage.dart';
import 'package:bmicalculator/Widget/HomePage/GenderCard.dart';
import 'package:bmicalculator/Widget/HomePage/Scales.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String picLink = 'https://instagram.fblr15-1.fna.fbcdn.net/v/t51.2885-19/s150x150/117804326_3239540706132128_9136898892301622641_n.jpg?_nc_ht=instagram.fblr15-1.fna.fbcdn.net&_nc_cat=108&_nc_ohc=NyjL1GgAQtsAX96NzGQ&edm=ALCvFkgBAAAA&ccb=7-4&oh=00_AT_CnxTbC82e8xsTASIr6D7Mu75hXALPbJhyyRD4xcY7Uw&oe=61D730A2&_nc_sid=643ae9';
  int _genderSelect = 1;
  bool _selectMale = true;
  bool _selectFemale = false;

  void _calculateBMI(){
    BMI currentInstance = BMI(
        gender: _genderSelect,
        height: _controllerForHeight.selectedItem,
        weight: _controllerForWeight.selectedItem,
    );
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ReportPage(currentInstance: currentInstance,)));
  }

  void _changeGender(int currentGender){
    setState(() {
      _genderSelect = currentGender;
      if(_genderSelect == 0){
        _selectMale = true;
        _selectFemale = false;
      }else if(_genderSelect == 1){
        _selectMale = false;
        _selectFemale = true;
      }
    });
  }
  late FixedExtentScrollController _controllerForHeight;
  late FixedExtentScrollController _controllerForWeight;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controllerForHeight = FixedExtentScrollController(initialItem: 140);
    _controllerForWeight = FixedExtentScrollController(initialItem: 45);
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              iconTheme: IconTheme.of(context).copyWith(color: Colors.black),
              pinned: true,
              elevation: 0,
              backgroundColor: Colors.grey[300],
              title: Row(
                children: const [
                  Text(
                    'BMI',
                    style: TextStyle(
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 24
                    ),
                  ),
                  Text(
                    ' Calculator',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24
                    ),
                  ),
                ],
              ),
              expandedHeight: screenSize.height * 0.225,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  padding: const EdgeInsets.all(25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end ,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Hello!',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.black,
                                fontSize: 26
                            ),
                          ),
                          Text(
                            'Arunesh Kumar',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 28
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        radius: 36,
                        backgroundColor: Colors.black,
                        child: CircleAvatar(
                          radius: 35,
                          backgroundColor: Colors.grey[200],
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.network(picLink),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  height: screenSize.height * 0.275,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: GenderCard(gender: 0,currentSelectedGender: _genderSelect,changeGender: _changeGender,isSelected: _selectMale,)),
                      const SizedBox(width: 10,),
                      Expanded(child: GenderCard(gender: 1,currentSelectedGender: _genderSelect,changeGender: _changeGender,isSelected: _selectFemale)),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
                child: Container(
                  height: screenSize.height * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MetricScale(nameOfScale: 'Height',controllerForHeight: _controllerForHeight,),
                      MetricScale(nameOfScale: 'Weight',controllerForHeight: _controllerForWeight,),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: _calculateBMI,
                child: Container(
                  margin: const EdgeInsets.only(left: 20,right: 20,bottom: 15,),
                  height: 75,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: const Center(
                    child: Text(
                      'Calculate',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        letterSpacing: 1.1,
                        fontStyle: FontStyle.italic,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}




