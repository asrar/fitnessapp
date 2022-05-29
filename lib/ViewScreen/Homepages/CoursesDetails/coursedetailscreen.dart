import 'package:fitnessapp/AppLayer/Overseer.dart';
import 'package:fitnessapp/ViewScreen/Homepages/Courses/getCoursesModel.dart';
import 'package:fitnessapp/ViewScreen/Homepages/homepage6.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseDetails extends StatefulWidget {
  //Todo: this class use for only home screen 1st listview
  List<Data> list = [];
  String title;

  CourseDetails({required this.list, required this.title});

  // final String image,
  //     description,
  //     totaldays,
  //     videoURL,
  //     totalWeek,
  //     title,
  //     courseTile;
  //
  // // List<dynamic> datalist = [];
  // CourseDetails(
  //     {Key? key,
  //     required this.courseTile,
  //     required this.description,
  //     required this.title,
  //     required this.image,
  //     required this.videoURL,
  //     required this.totaldays,
  //     required this.totalWeek})
  //     : super(key: key);

  @override
  _CourseDetailsState createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 20,
            ),
            Text("All ${widget.title} Courses"),

            SizedBox(
              height: 10,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.list.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(HomePage6(
                        courseId: widget.list[index].CourseCategories1.courseId.toString(),
                          dayAcivityonGoing: [],
                          videoURL: widget.list[index].video,
                          title: widget.list[index].title,
                          descriptiom: widget.list[index].description,
                          dayAcivity: widget.list[index].DayActivity1));
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 4),
                      child: Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "${Overseer.course_image_path}/${widget.list[index].image}"),
                                          fit: BoxFit.cover)),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "Total Week: ${widget.list[index].totalWeeks}"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        "Week a days: ${widget.list[index].weekADays}"),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        "Completion days: ${widget.list[index].daystocompletion}"),
                                  ],
                                )
                              ],
                            ),
                          ),
                          Divider(
                            height: 10,
                            thickness: 2,
                          ),
                        ],
                      ),
                    ),
                  );
                })
            // InkWell(
            //   onTap: () {
            //     // Get.to(
            //     //     HomePage6(
            //     //     videoURL: widget.videoURL,
            //     //     title: widget.title,
            //     //     descriptiom: widget.description,
            //     //     dayAcivity: []));
            //   },
            //   child: Container(
            //     width: double.infinity,
            //     child: Column(
            //       children: [
            //         // Container(
            //         //   width: double.infinity,
            //         //   height: 200,
            //         //   decoration: BoxDecoration(
            //         //       borderRadius: BorderRadius.circular(12),
            //         //       image: DecorationImage(
            //         //         image: NetworkImage("${widget.image}"),
            //         //         fit: BoxFit.cover,
            //         //       )),
            //         // ),
            //         // SizedBox(
            //         //   height: 10,
            //         // ),
            //         // richText("Course Title: ", "${widget.title}"),
            //         // SizedBox(
            //         //   height: 10,
            //         // ),
            //         // richText("Course Completion Week: ", "${widget.totalWeek}"),
            //         // SizedBox(
            //         //   height: 10,
            //         // ),
            //         // richText("Course Completion days: ", "${widget.totaldays}"),
            //         // SizedBox(
            //         //   height: 10,
            //         // ),
            //         // richText("Course Description ", "${widget.description}"),
            //         // SizedBox(
            //         //   height: 10,
            //         // ),
            //       ],
            //     ),
            //   ),
            // ),
          ]),
        ),
      )),
    );
  }

  richText(String text1, String text2) {
    return Align(
      alignment: Alignment.topLeft,
      child: RichText(
        text: TextSpan(
            text: text1,
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(
                text: text2,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              )
            ]),
      ),
    );
  }
}
