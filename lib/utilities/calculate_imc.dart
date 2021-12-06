class CalculateIMC {
  double calculate(String weight, String size) {
    var weightParse = double.parse(weight);
    var sizeParse = double.parse(size);

    var sizeMeters = sizeParse / 100;

    double result = weightParse / (sizeMeters * sizeMeters);
    return result;
  }
}
