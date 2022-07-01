import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/audio_cubit/audio_cubit.dart';

class PositionData {
  PositionData(this.position, this.bufferedPosition, this.duration);

  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;
}

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: (){
              Navigator.pushNamed(context, '/BreakingNewsView');
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<PositionData>(
            stream: context.read<AudioCubit>().positionDataStream,
            builder: (_, snapshot) {
              final positionData = snapshot.data;
              final duration = positionData?.duration.inMicroseconds ?? 1;
              final position = positionData?.position.inMicroseconds ?? 0;
              return Slider(
                onChanged: context.read<AudioCubit>().changePositionPlayer,
                onChangeEnd: context.read<AudioCubit>().changePositionPlayer,
                value: position > 0 && position <= duration
                    ? position / duration
                    : 0.0,
              );
            },
          ),
          StreamBuilder<PositionData>(
              stream: context.read<AudioCubit>().positionDataStream,
              builder: (_, snapshot) {
                final positionData = snapshot.data;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      positionData?.position.durationPlayer() ?? '0:00',
                    ),
                    Text(
                      positionData?.duration.durationPlayer() ?? '0:00',
                    ),
                  ],
                );
              }),
          Stack(
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 10),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                // color: Palette.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      // onTap: context.read<PlayerScreenCubit>().skip30second,
                      onTap: context.read<AudioCubit>().stop,
                      child: const Icon(
                        Icons.replay_30_outlined,
                        size: 50,
                        // color: Palette.label,
                      ),
                    ),
                    InkWell(
                      // onTap: context.read<PlayerScreenCubit>().preAudio,
                      onTap: context.read<AudioCubit>().play,
                      child: const Icon(
                        Icons.skip_previous,
                        size: 50,
                        // color: Palette.label,
                      ),
                    ),
                    // _PlayButtonWidget(),
                    InkWell(
                      // onTap: context.read<PlayerScreenCubit>().playAudio,
                      onTap: null,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 8,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      // onTap: context.read<PlayerScreenCubit>().nextAudio,
                      onTap: null,
                      child: const Icon(
                        Icons.skip_next,
                        size: 50,
                        // color: Palette.label,
                      ),
                    ),
                    InkWell(
                      // onTap: context.read<PlayerScreenCubit>().forward30second,
                      onTap: null,
                      child: const Icon(
                        Icons.forward_30_outlined,
                        size: 50,
                        // color: Palette.label,
                      ),
                    ),
                  ],
                ),
              ),
              // const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 5),
              //   child: SliderWidget(height: 20),
              // ),
            ],
          )
        ],
      ),
    );
  }
}

class Sliders extends StatefulWidget {
  const Sliders({Key? key}) : super(key: key);

  @override
  _SliderState createState() => _SliderState();
}

class _SliderState extends State<Slider> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PositionData>(
      stream: context.read<AudioCubit>().positionDataStream,
      builder: (_, snapshot) {
        final positionData = snapshot.data;
        final duration = positionData?.duration.inMicroseconds ?? 1;
        final position = positionData?.position.inMicroseconds ?? 0;
        return Slider(
          onChanged: context.read<AudioCubit>().changePositionPlayer,
          onChangeEnd: context.read<AudioCubit>().changePositionPlayer,
          value:
              position > 0 && position <= duration ? position / duration : 0.0,
        );
      },
    );
  }
}

extension DurationExtension on Duration {
  String durationPlayer() {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    if (twoDigits(inHours.remainder(60)) != '00') {
      final twoDigitHour = twoDigits(inHours.remainder(60));
      final twoDigitMinutes = twoDigits(inMinutes.remainder(60));
      final twoDigitSeconds = twoDigits(inSeconds.remainder(60));
      return '$twoDigitHour:$twoDigitMinutes:$twoDigitSeconds';
    }
    final twoDigitMinutes = twoDigits(inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }
}
