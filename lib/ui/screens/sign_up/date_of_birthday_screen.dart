import 'package:flutter/material.dart';
import 'package:revvy/ui/constants/AppColors.dart';
import 'package:revvy/ui/constants/AppSizes.dart';
import 'package:revvy/ui/widgets/buttons/button_primary.dart';
import 'package:revvy/ui/widgets/inputs/top_labeled_input.dart';
import 'package:revvy/ui/widgets/platform/platform_scaffold.dart';
import 'package:revvy/ui/widgets/screen/app_appbar_screen.dart';

class DateOfBirthdayScreen extends StatefulWidget {
  static const String Route = '/sign_up/date_of_birthday_screen';
  DateOfBirthdayScreen({Key? key}) : super(key: key);

  @override
  _DateOfBirthdayScreenState createState() => _DateOfBirthdayScreenState();
}

class _DateOfBirthdayScreenState extends State<DateOfBirthdayScreen> {
  String dropdownMonthValue = 'Month';
  String dropdownDayValue = 'DD';
  String dropdownYearValue = 'YYYY';
  @override
  Widget build(BuildContext context) {
    return PlatformScaffold(
      body: AppAppBarScreen(
        widget: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Container(
                  height: 200,
                  alignment: Alignment.center,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: 'What\'s Your Birthday',
                      style: Theme.of(context).textTheme.headline1,
                      children: <TextSpan>[
                        TextSpan(
                          text: '?',
                          style:
                              Theme.of(context).textTheme.headline1?.copyWith(
                                    color: AppColors.ORANGE,
                                  ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _monthInput(),
                  _dayInput(),
                  _yearInput(),
                ],
              ),
              SizedBox(
                height: 200,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Step 2 of 8",
                    style: Theme.of(context).textTheme.bodyText1!.copyWith(
                        color: AppColors.PRIMARY_SWATCH[200],
                        fontSize: AppSizes.INPUT_TOP_LABEL_TEXT),
                  ),
                  ButtonPrimary(
                    child: Text(
                      'Next >',
                    ),
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(DateOfBirthdayScreen.Route);
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  TopLabeledInput _monthInput() {
    return TopLabeledInput(
        label: 'Month',
        widget: DropdownButton<String>(
          value: dropdownMonthValue,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) {
            setState(
              () {
                dropdownMonthValue = newValue!;
              },
            );
          },
          items: <String>[
            'Month',
            'January',
            'February',
            'March',
            'April',
            'May',
            'June',
            'July',
            'August',
            'September',
            'October',
            'November',
            'December'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }

  TopLabeledInput _dayInput() {
    return TopLabeledInput(
        label: 'Day',
        widget: DropdownButton<String>(
          value: dropdownDayValue,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) {
            setState(
              () {
                dropdownDayValue = newValue!;
              },
            );
          },
          items: <String>[
            'DD',
            '1',
            '2',
            '3',
            '4',
            '5',
            '6',
            '7',
            '8',
            '9',
            '10',
            '11',
            '12',
            '13',
            '14',
            '15',
            '16',
            '17',
            '18',
            '19',
            '20',
            '21',
            '22',
            '23',
            '24',
            '25',
            '26',
            '27',
            '28',
            '29',
            '30',
            '31'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }

  TopLabeledInput _yearInput() {
    return TopLabeledInput(
        label: 'Year',
        widget: DropdownButton<String>(
          value: dropdownYearValue,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          style: const TextStyle(color: Colors.deepPurple),
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (String? newValue) {
            setState(
              () {
                dropdownYearValue = newValue!;
              },
            );
          },
          items: <String>[
            'YYYY',
            '1970',
            '1971',
            '1972',
            '1973',
            '1974',
            '1975',
            '1976',
            '1977',
            '1978',
            '1979',
            '1980',
            '1981',
            '1982',
            '1983',
            '1984',
            '1985',
            '1986',
            '1987',
            '1988',
            '1989',
            '1990',
            '1991',
            '1992',
            '1993',
            '1994',
            '1995',
            '1996',
            '1997',
            '1998',
            '1999',
            '2000',
            '2001',
            '2002',
            '2003',
            '2004',
            '2005',
            '2006',
            '2007'
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ));
  }
}
