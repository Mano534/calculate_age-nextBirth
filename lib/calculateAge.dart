import 'package:age_calc/showAge.module.dart';
import 'package:age_calculator/age_calculator.dart'as ag;

import 'nextBirthDate.modul.dart';

class CalculateAge {
  ShowAge calculateAge(DateTime birthday, DateTime futureDate) {
      //Find out your age on any given date
  final  age = ag.AgeCalculator.age(birthday, today: futureDate);
  final _age = ShowAge();
  _age.years = age.years;
  _age.months = age.months;
  _age.days = age.days;
    return _age;
  }
  NextBirth nextBirthdayCalc(DateTime birthday,DateTime futureDate){
     // Find out when your next birthday will be on any given date
  final nextBirth = ag.AgeCalculator.timeToNextBirthday(birthday,
      fromDate: futureDate);
  // You next birthday will be in Years: 0, Months: 0, Days: 3
  final _nxtBirth= NextBirth();
  _nxtBirth.years = nextBirth.years;
  _nxtBirth.months = nextBirth.months;
  _nxtBirth.days = nextBirth.days;
    return _nxtBirth;
  }
}
