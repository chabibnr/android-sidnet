import 'package:app/config/color_config.dart';
import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  Widget renderItem(int number) {
    return InkWell(
      child: Container(
        height: 66,
        width: 66,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.05),
          borderRadius: BorderRadius.all(
            Radius.circular(66),
          ),
        ),
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
      ),
    );
  }

  Widget renderNumber(List<int> numbers) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: numbers.map((e) => renderItem(e)).toList(),
      ),
    );
  }

  Widget renderLastButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            child: Container(
              height: 66,
              width: 66,
              decoration: BoxDecoration(
                color: Color(0xFFFF7575),
                borderRadius: BorderRadius.all(
                  Radius.circular(66),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.clear,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
          renderItem(0),
          InkWell(
            child: Container(
              height: 66,
              width: 66,
              decoration: BoxDecoration(
                color: ColorConfig.orange,
                borderRadius: BorderRadius.all(
                  Radius.circular(66),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.backspace,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        margin: const EdgeInsets.only(
          top: 70,
          left: 20,
          right: 20,
          bottom: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Container(
          color: Color(0xFFEFEFEF),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Text(
                          '300',
                          style: TextStyle(
                            fontSize: 30,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              renderNumber([1, 2, 3]),
              renderNumber([4, 5, 6]),
              renderNumber([7, 8, 9]),
              renderLastButton(),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Batal',
                            style: TextStyle(
                              color: Colors.black.withOpacity(.75),
                              fontSize: 14,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Colors.black.withOpacity(.1),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: ColorConfig.blueButton.withOpacity(.25),
                                spreadRadius: 5,
                                blurRadius: 8,
                                offset: const Offset(0, 1), // changes position of shadow
                              ),
                            ],
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Simpan',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                            style: TextButton.styleFrom(
                              backgroundColor: ColorConfig.blueButton,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
