import 'package:get/get.dart';

import 'helper_functions/calculate.dart';

class ButtonController extends GetxController {
  String _pointerText = "0", _finalText = "";

  bool _lastExpressionIsEqual = false;

  final String _operators = "+-÷×";

  String get pointerText => _pointerText;

  String get finalText => _finalText;

  void onNumericButtonPress(String buttonText) {
    if (_lastExpressionIsEqual) {
      _finalText = "";
      _pointerText = "";
    }
    if (_pointerText == "0") {
      _pointerText = "";
    }
    _pointerText = _pointerText + buttonText;
    _lastExpressionIsEqual = false;
    update();
  }

  void onSymbolButtonPress(String buttonText) {
    switch (buttonText) {
      case "C":
        if (_pointerText == "0" || _lastExpressionIsEqual) {
          _pointerText = "";
          _finalText = "";
        }
        _pointerText = "0";
        break;
      case "%":
        var number = double.parse(_pointerText);
        var res = number / 100.00;
        _pointerText = res.toStringAsFixed(2);
        break;
      case "DEL":
        _pointerText = _pointerText.substring(0, _pointerText.length - 1);
        if (_pointerText == "" || _pointerText == "-") {
          _pointerText = "0";
        }
        break;
      default:
        if (_pointerText != "0") {
          if (_pointerText[0] == "-") {
            _pointerText = _pointerText.substring(1);
          } else {
            _pointerText = "-$_pointerText";
          }
        }
    }

    update();
  }

  void onOparationalButtonPress(String buttonText) {
    if (_lastExpressionIsEqual) {
      _finalText = "";
    }
    var len = _finalText.length;
    if (_finalText != "" &&
        _operators.contains(_finalText[len - 1]) &&
        _pointerText == "0") {
      _finalText = finalText.substring(0, len - 1);
      _finalText = "$_finalText$buttonText";
    } else {
      var num = _pointerText;
      _finalText = "$_finalText$num";
      _pointerText = "0";
      if (_operators.contains(buttonText)) {
        _lastExpressionIsEqual = false;
        _finalText = "$_finalText$buttonText";
      } else {
        _lastExpressionIsEqual = true;
        _pointerText = Calculate.evaluate(_finalText);
      }
    }
    update();
  }
}
