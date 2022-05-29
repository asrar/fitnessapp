import 'dart:async';
import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/ViewScreen/Homepages/Courses/getCoursesModel.dart';
import 'package:fitnessapp/ViewScreen/Homepages/Courses/courseservice.dart';
import 'package:fitnessapp/ViewScreen/UpdateFitnessProfile/UpdateFitnessProfileModel.dart';
import 'package:rxdart/rxdart.dart';
import 'UpdateFitnessProfileService.dart';

class UpdateFitnessProfileManager {
  final BehaviorSubject<List<UpdateFitenessProfileModel>> _main =
      BehaviorSubject<List<UpdateFitenessProfileModel>>();

  Stream<List<UpdateFitenessProfileModel>> get mainList async* {
    String query =
        "height=${Overseer.height}&weight=${Overseer.weight}&fitness_goal_id=${Overseer.fitnesgoal_id}&weightin=${Overseer.weighttin}&heightin=${Overseer.heightin}";
    yield await UpdateFitnessProfileService.browse(query);
    // https://yfitness.com/fitness/public/api/updateFitnessProfile/8?fitness_goal_id=1&height=160&heightin=cm&weight=60&weightin=kg
  }

  UpdateFitnessProfileManager() {
    print("-- getting data from stream");
    mainList.listen((value) => _main.addStream(mainList));
  }
}
