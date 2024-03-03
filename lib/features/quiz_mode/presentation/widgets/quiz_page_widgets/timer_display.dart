// ignore_for_file: prefer_const_constructors

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_portal/flutter_portal.dart';
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
    return Expanded(
        flex: 0,
        child: Align(
          alignment: Alignment.bottomRight,
          child: TimerOverlay(),
        ));
  }
}

class TimerOverlay extends StatefulWidget {
  const TimerOverlay({super.key});

  @override
  State<TimerOverlay> createState() => _TimerOverlayState();
}

class _TimerOverlayState extends State<TimerOverlay> {
  @override
  Widget build(BuildContext context) {
    return Portal(
        child: PortalTarget(
            visible: true,
            anchor: const Aligned(
              follower: Alignment.bottomRight,
              target: Alignment.bottomCenter,
            ),
            portalFollower: Container(
                margin: EdgeInsets.only(right: 20), child: CountdownTimer()),
            child: SizedBox()));
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
      ringColor: Colors.grey[300]!,
      ringGradient: null,
      fillColor: Colors.grey[600]!,
      fillGradient: null,
      backgroundColor: Colors.grey[500],
      backgroundGradient: null,
      strokeWidth: 10.0,
      strokeCap: StrokeCap.round,
      textStyle: TextStyle(
          fontSize: 20.0, color: Colors.white, fontWeight: FontWeight.bold),
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
              return ConfirmTimeoutQuizDialogue(quizBloc: context.read<QuizBloc>());
            });
      },
      onChange: (String timeStamp) {
        // debugPrint('Countdown Changed $timeStamp');
      },
      timeFormatterFunction: (defaultFormatterFunction, duration) {
        if (duration.inSeconds == 0) {
          return "Start";
        } else {
          return Function.apply(defaultFormatterFunction, [duration]);
        }
      },
    );
  }
}
