List<String> setHoursWithSunriseAndSunset(
  DateTime currentTime,
  List<String> sunriseList,
  List<String> sunsetList,
  int totalHours,
) {
  DateTime sunrise = DateTime.parse(sunriseList[0]);
  DateTime sunset = DateTime.parse(sunsetList[0]);

  List<String> result = [];

  for (int i = 0; i < totalHours; i++) {
    int hour = (currentTime.hour + i) % 24;
    result.add("${hour.toString().padLeft(2, "0")}:00\n");
    if (hour == sunrise.hour) {
      result.add(
        "${sunrise.hour.toString().padLeft(2, "0")}:${sunrise.minute.toString().padLeft(2, "0")}",
      );
    }

    if (hour == sunset.hour) {
      result.add("${sunset.hour}:${sunset.minute}");
    }
  }

  return result;
}

// ? Weather code List
// 	2,
// 	2,
// 	2,
// 	3,
// 	2,
// 	2,
// 	2,
// 	1,
// 	1,
// 	1,
// 	1,
// 	2,
// 	2,
// 	1,
// 	1,
// 	1,
// 	2,
// 	2,
// 	2,
// 	2,
// 	2,
// 	2,
// 	2,
// 	2

List<int> weatherCodeList(
  List<String> hours,
  List<int> weatherCode,
  List<String> sunriseList,
  List<String> sunsetList,
) {
  DateTime sunrise = DateTime.parse(sunriseList[0]);
  DateTime sunset = DateTime.parse(sunsetList[0]);
  if (weatherCode.length < 26) {
    for (int i = 0; i < hours.length; i++) {
      if (int.tryParse(hours[i].split(":")[1]) == sunrise.minute) {
        if (!weatherCode.contains(202)) {
          weatherCode.insert(i, 202);
        }
      }

      if (int.tryParse(hours[i].split(":")[1]) == sunset.minute) {
        if (!weatherCode.contains(203)) {
          weatherCode.insert(i, 203);
        }
      }
      // print(int.tryParse(i.split(":")[0]) == sunrise.hour);
    }
  }

  print("hours: $hours");
  return weatherCode;
}





// void startTimer(Function(DateTime) onTick) {
//   Timer.periodic(const Duration(minutes: 1), (timer) {
//     onTick(DateTime.now());
//   });
// }

// //

// Timer? hourlyTimer;

// void startHourlyClock() {
//   DateTime now = DateTime.now();

//   // احسب كم باقي على بداية الساعة القادمة
//   int secondsToNextHour = (60 - now.minute) * 60 - now.second;

//   // تايمر أولي يوصل للساعة الجاية بالضبط
//   Timer(Duration(seconds: secondsToNextHour), () {
//     // أول حدث عند بداية الساعة

//     // بعدين نبدأ التكرار كل ساعة كاملة
//     hourlyTimer = Timer.periodic(const Duration(hours: 1), (timer) {});
//   });
// }