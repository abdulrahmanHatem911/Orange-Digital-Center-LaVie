import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orange_pro0/layout/cubit/cubit.dart';
import 'package:orange_pro0/layout/cubit/state.dart';
import 'package:orange_pro0/models/questions/question_model.dart';
import 'package:orange_pro0/shared/components/button.dart';
import 'package:orange_pro0/shared/constant/spaces.dart';
import 'package:orange_pro0/shared/style/color.dart';

class QuestionScreen extends StatefulWidget {
  PageController _pageController = PageController(initialPage: 0);
  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
            ),
            body: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: widget._pageController,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: QuestionModel.questionData.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25.0,
                          vertical: 10.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Question ',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        fontSize: 36.0,
                                        fontWeight: FontWeight.w500,
                                        color: PBlack,
                                      ),
                                ),
                                Text(
                                  '${index + 1}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(
                                        fontSize: 36,
                                        fontWeight: FontWeight.w500,
                                        color: PGreen,
                                      ),
                                ),
                                Text(
                                  '/ ${QuestionModel.questionData.length}',
                                  style: TextStyle(
                                    color: PGray500,
                                  ),
                                )
                              ],
                            ),
                            PVSpace40,
                            Text(
                              '${QuestionModel.questionData[index].question}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w600,
                                    color: PBlack,
                                  ),
                            ),
                            PVSpace60,
                            buildQuestion(index, 'A'),
                            PVSpace20,
                            buildQuestion(index, 'B'),
                            PVSpace20,
                            buildQuestion(index, 'C'),
                            PVSpace20,
                            buildQuestion(index, 'D'),
                            PVSpace20,
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          widget._pageController.previousPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: PGray300,
                              width: 2.0,
                            ),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                              child: Text(
                            'Back',
                            style: Theme.of(context)
                                .textTheme
                                .headline4!
                                .copyWith(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    color: PGreen),
                          )),
                        ),
                      ),
                    ),
                    PHSpace20,
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          widget._pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.06,
                          decoration: BoxDecoration(
                            color: PGreen,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Text(
                              'Next',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    color: PWhite,
                                  ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                PVSpace25,
              ],
            ));
      },
    );
  }

  Widget buildQuestion(int index, String title) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: PGreen, width: 2.0),
      ),
      child: Row(
        children: [
          Text(
            '${QuestionModel.questionData[index].answers![title]}',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                  color: PBlack,
                ),
          ),
          Spacer(),
          Container(
            width: 35.0,
            height: 35.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: PGreen, width: 3.0),
            ),
          )
        ],
      ),
    );
  }
}
