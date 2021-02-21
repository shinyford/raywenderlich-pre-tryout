// Copyright (c) 2021 Razeware LLC

// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without
// restriction, including without limitation the rights to use,
// copy, modify, merge, publish, distribute, sublicense, and/or
// sell copies of the Software, and to permit persons to whom
// the Software is furnished to do so, subject to the following
// conditions:

// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.

// Notwithstanding the foregoing, you may not use, copy, modify,
// merge, publish, distribute, sublicense, create a derivative work,
// and/or sell copies of the Software in any work that is designed,
// intended, or marketed for pedagogical or instructional purposes
// related to programming, coding, application development, or
// information technology. Permission for such use, copying,
// modification, merger, publication, distribution, sublicensing,
// creation of derivative works, or sale is expressly withheld.

// This project and source code may use libraries or frameworks
// that are released under various Open-Source licenses. Use of
// those libraries and frameworks are governed by their own
// individual licenses.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
// HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
// WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputAmount extends StatefulWidget {
  final double value;
  final String label;
  final String trailingLabel;
  final Function onChanged;

  const InputAmount({Key key, this.value, this.label, this.trailingLabel, this.onChanged}) : super(key: key);

  @override
  _InputAmountState createState() => _InputAmountState();
}

class _InputAmountState extends State<InputAmount> {
  TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(
      text: widget.value.toString().replaceAll(RegExp(r'\.0*$'), '') // if fractional part zero, remove it and decimal point
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.label + ':'),
        SizedBox(width: 16),
        Expanded(
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              DecimalInputFormatter()
            ],
            onChanged: (text) => widget.onChanged?.call(double.tryParse(text) ?? 0)
          ),
        ),
        SizedBox(width: 16),
        Text(widget.trailingLabel)
      ]
    );
  }
}

class DecimalInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text == '') return newValue;
    if (double.tryParse(newValue.text) is double) return newValue;
    return oldValue;
  }
}
