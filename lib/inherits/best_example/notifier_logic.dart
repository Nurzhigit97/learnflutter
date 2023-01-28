//! Логика
import 'package:flutter/material.dart';

class CalcWidgetModel extends ChangeNotifier {
  num? _firstNumber;
  num? _secondNumber;
  num? summResult;
//! полученные инпуты делаем типа int
  set firstNumber(String value) => _firstNumber = int.tryParse(value);
  set secondNumber(String value) => _secondNumber = int.tryParse(value);

  void summ() {
    num? summResult;
    if (_firstNumber != null && _secondNumber != null) {
      summResult = _firstNumber! + _secondNumber!;
    } else {
      summResult = null;
    }

    //! если новый с старым похожи не обновлят результат
    if (this.summResult != summResult) {
      this.summResult = summResult;
      //! notifyListeners- Отправляет в переменную результат
      notifyListeners();
    }
  }

  void minus() {
    num? summResult;
    if (_firstNumber != null && _secondNumber != null) {
      summResult = _firstNumber! - _secondNumber!;
    } else {
      summResult = null;
    }

    //! если новый с старым похожи не обновлят результат
    if (this.summResult != summResult) {
      this.summResult = summResult;
      //! notifyListeners- Отправляет в переменную результат
      notifyListeners();
    }
  }

  void divide() {
    num? summResult;
    if (_firstNumber != null && _secondNumber != null) {
      summResult = _firstNumber! / _secondNumber!;
    } else {
      summResult = null;
    }

    //! если новый с старым похожи не обновлят результат
    if (this.summResult != summResult) {
      this.summResult = summResult;
      //! notifyListeners- Отправляет в переменную результат
      notifyListeners();
    }
  }

  void mult() {
    num? summResult;
    if (_firstNumber != null && _secondNumber != null) {
      summResult = _firstNumber! * _secondNumber!;
    } else {
      summResult = null;
    }

    //! если новый с старым похожи не обновлят результат
    if (this.summResult != summResult) {
      this.summResult = summResult;
      //! notifyListeners- Отправляет в переменную результат
      notifyListeners();
    }
  }
}
