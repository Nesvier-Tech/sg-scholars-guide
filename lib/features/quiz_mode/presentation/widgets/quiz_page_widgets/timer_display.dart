// ignore_for_file: prefer_const_constructors

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/state_management/quiz/quiz_bloc.dart';
import 'package:scholars_guide/features/quiz_mode/presentation/widgets/quiz_page_widgets/confirm_timeout_quiz_dialogue.dart';

class TimerDisplay extends StatefulWidget {
  const TimerDisplay({super.key});

  @override
  State<TimerDisplay> createState() => _TimerDisplayState();
}

class _TimerDisplayState extends State<TimerDisplay> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: MediaQuery.of(context).size.width * 0.05,
      bottom: MediaQuery.of(context).size.width * 0.05,
      child: CountdownTimer(),
    );
  }
}

class CountdownTimer extends StatefulWidget {
  const CountdownTimer({super.key});

  @override
  State<CountdownTimer> createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      duration: 60 * 10, // ! 10 minutes muna
      initialDuration: 0,
      controller: CountDownController(),
      width: MediaQuery.of(context).size.width / 6,
      height: MediaQuery.of(context).size.height / 6,
      ringColor: Color.fromRGBO(128, 0, 0, 1).withOpacity(0.0),
      ringGradient: null,
      fillColor: Color.fromRGBO(128, 0, 0, 1).withOpacity(0.5),
      fillGradient: null,
      backgroundColor: Colors.white.withOpacity(0.3),
      backgroundGradient: null,
      strokeWidth: 5.0,
      strokeCap: StrokeCap.round,
      textStyle: TextStyle(
          fontSize: 20.0,
          color: Color.fromRGBO(128, 0, 0, 1).withOpacity(0.7),
          fontWeight: FontWeight.bold),
      textFormat: CountdownTextFormat.S,
      isReverse: true,
      isReverseAnimation: true,
      isTimerTextShown: true,
      autoStart: true,
      onStart: () {
        // debugPrint('Countdown Started');
      },
      onComplete: () {
        // debugPrint('Countdown Ended');
        showDialog<AlertDialog>(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext buildContext) {
              return ConfirmTimeoutQuizDialogue(
                  quizBloc: context.read<QuizBloc>());
            });
      },
      onChange: (String timeStamp) {
        // debugPrint('Countdown Changed $timeStamp');
      },
      timeFormatterFunction: (defaultFormatterFunction, duration) {
        if (duration.inSeconds == 0) {
          return "End";
        } else {
          final minutes = duration.inMinutes;
          final seconds = duration.inSeconds % 60;
          return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
        }
      },
    );
  }
}
