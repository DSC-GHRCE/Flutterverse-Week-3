class BMI {
  int gender;
  int height;
  int weight;
  double bmiValue = 0;
  BMI({required this.gender,required this.height,required this.weight}){
    bmiValue = calculateBMI();
  }
  double calculateBMI () {
    return ((weight / (height * height) )* 10000);
  }
}