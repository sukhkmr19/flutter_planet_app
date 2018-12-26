import 'dart:math';

double round(double val, double places) {
  double mod = pow(10.0, places);
  return ((val * mod).round().toDouble() / mod);
}
