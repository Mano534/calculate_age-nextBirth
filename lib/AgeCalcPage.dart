import 'package:ageCalc/showAge.module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'calculateAge.dart';
import 'nextBirthDate.modul.dart';

class AgeCalHomeScreen extends StatelessWidget {
  BuildContext? context;
  DateTime? _pickedDate;
  DateTime? _today;

  final _showAge = ShowAge();
  final _nextBirth = NextBirth();
  final calcAge = CalculateAge().calculateAge;
  final calcNextbirth = CalculateAge().nextBirthdayCalc;
  
  
  @override
  Widget build(BuildContext context) {
    _buildAppBar() {
      return AppBar(
          centerTitle: true,
          title: Text('Age Calculator App',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Colors.white)));
    }

    _buildtitle(String title) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Center(
          child: Text(title,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                  color: Colors.lightBlueAccent, fontWeight: FontWeight.bold)),
        ),
      );
    }

    _getTextInputDecoration() {
      return InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor)),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
              borderRadius: BorderRadius.circular(12)),
          suffixIcon: Icon(
            Icons.calendar_today,
            color: Theme.of(context).primaryColor,
          ),
          hintText: "2023-2-1",
          hintStyle: Theme.of(context).textTheme.bodyLarge);
    }

    _buildDateOfBirthInput() {
      return TextField(
          decoration: _getTextInputDecoration(),
          readOnly: true,
          onTap: () async {
             _pickedDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1940),
                lastDate: DateTime.now());
          });
    }

    _buildTodaysDateInput() {
      return TextField(
          decoration: _getTextInputDecoration(),
          readOnly: true,
          onTap: () async {
             _today = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(1940),
                lastDate: DateTime.now());
          });
    }

    _emptyBox() {
      return SizedBox(
        height: 20,
      );
    }

    _buildButtonsRow() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ElevatedButton(
              onPressed: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Center(
                    child: Text('Clear',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: Colors.white))),
              )),
          ElevatedButton(
              onPressed: () {
                calcAge(_pickedDate!,_today!);
                calcNextbirth(_pickedDate!,_today!);
                print(ShowAge());
                print(NextBirth());
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Center(
                    child: Text('Calculate',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            ?.copyWith(color: Colors.white))),
              ))
        ],
      );
    }

    _buildOutPut(String date, String dateValue){
      return  Column(
            children: [
              Container(
                width: 115,
                height: 30,
                child: Center(
                    child: Text(
                  date,
                  style: TextStyle(color: Colors.white),
                )),
                color: Theme.of(context).primaryColor,
              ),
              Container(
                width: 115,
                height: 30,
                child: Center(child: Text(dateValue)),
                decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor)),
              ),
            ],
          );
    }

    _buildShowAgeRow() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildOutPut('Years', _showAge.years.toString()),
          _buildOutPut('Months', _showAge.months.toString()),
          _buildOutPut('Days',_showAge.days.toString() ),
        ],
      );
    }

    _buildShowNextBirthdayRow() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildOutPut('Years', _nextBirth.years.toString()),
          _buildOutPut('Months', _nextBirth.months.toString()),
          _buildOutPut('Days', _nextBirth.days.toString()),
        ],
      );
    }

    return Scaffold(
      appBar: _buildAppBar(),
      // end of app bar
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _buildtitle('Date of Birth'),
            _buildDateOfBirthInput(),
            _emptyBox(),
            _buildtitle('Today Date'),
            _buildTodaysDateInput(),
            _emptyBox(),
            _buildButtonsRow(),
            _buildtitle('Age is'),
            _buildShowAgeRow(),
            _emptyBox(),
            _buildtitle('Next Birthday Is'),
            _buildShowNextBirthdayRow(),
          ],
        ),
      ),
    );
  }
}
