import 'package:equatable/equatable.dart';
import 'package:just_audio/just_audio.dart';

class AudioState extends Equatable {
  const AudioState({
    required this.player,
    this.isPlaying = false,
  });

  final AudioPlayer player;
  final bool isPlaying;

  AudioState copyWith({
    AudioPlayer? player,
    double? playbackRate,
    int? timer,
    int? idBook,
    int? totalPage,
    Duration? timeListen,
    bool? isPlaying,
  }) {
    return AudioState(
      player: player ?? this.player,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }

  @override
  List<Object?> get props => [
        player,
        isPlaying,
      ];
}
