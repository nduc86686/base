import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:duck/src/injector.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

import '../../views/audio/play_screen.dart';
import 'audio_state.dart';
@injectable
class AudioCubit extends Cubit<AudioState> {
  AudioCubit(@factoryParam this.audioPlayer) : super(AudioState(player: audioPlayer));
  final AudioPlayer audioPlayer;

  void init() async {
    await state.player.setUrl(
        'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3');
    state.player.playerStateStream.listen((state) {
      if (state.playing) {
        print('play');
        changeState(true);
      } else {
        print('no play');
        changeState(false);
      }
      switch (state.processingState) {
        case ProcessingState.idle:
          print('');
          break;
        case ProcessingState.loading:
          print('');

          break;
        case ProcessingState.buffering:
          print('');

          break;
        case ProcessingState.ready:
          print('');

          break;
        case ProcessingState.completed:
          print('');
      }
    });
    await state.player.play();

  }

  void stop(){
    state.player.stop();
  }
  void play(){
    state.player.play();
  }

  void changeState(bool isPlay){
    emit(AudioState(isPlaying: isPlay, player: audioPlayer,));
  }
  Duration get duration =>
      state.player.duration ?? const Duration(milliseconds: 1);

  Future<void> changePositionPlayer(double value) async {
    if (duration.inSeconds >= 0) {
      final position = value * duration.inSeconds;
      // ignore: unawaited_futures
      state.player.seek(Duration(seconds: position.round()));
      // ignore: unawaited_futures
    }
  }

  Stream<PositionData> get positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          state.player.positionStream,
          state.player.bufferedPositionStream,
          state.player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));
}
