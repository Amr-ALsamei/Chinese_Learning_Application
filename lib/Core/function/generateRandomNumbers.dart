import 'dart:math';

int randomInt(int min, int max) {
  return Random().nextInt(max - min + 1) + min;
}
