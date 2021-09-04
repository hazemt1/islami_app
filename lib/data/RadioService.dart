import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/data/AppConfigProvider.dart';
import 'package:islami_app/data/UserPreferences.dart';
import 'package:islami_app/model/Radios.dart';
import 'package:provider/provider.dart';

class RadioService extends StatefulWidget {
  final List<Radios> radios;
  RadioService(this.radios);
  @override
  _RadioServiceState createState() => _RadioServiceState();
}

class _RadioServiceState extends State<RadioService> {
  late AppConfigProvider provider;
  int index = 0;
  //int index = UserPreferences.getRadioStation();
  AudioPlayer audioPlayer = AudioPlayer();
  bool playing = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    stop();
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              if (index == 0)
                index = widget.radios.length - 1;
              else
                index--;
              UserPreferences.setRadioStation(index);
              if (playing) play();
            });
          },
          child: Icon(
            provider.currentLocale == 'en'
                ? Icons.skip_previous
                : Icons.skip_next,
            color: (provider.isDarkModeEnabled()
                ? Colors.amberAccent
                : Colors.black),
            size: 50,
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              if (playing)
                stop();
              else
                play();
              playing = !playing;
              print(widget.radios[index].name);
            });
          },
          child: Icon(
            playing ? Icons.pause : Icons.play_arrow,
            color: (provider.isDarkModeEnabled()
                ? Colors.amberAccent
                : Colors.black),
            size: 50,
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              if (index == widget.radios.length - 1)
                index = 0;
              else
                index++;
              UserPreferences.setRadioStation(index);
              if (playing) play();
            });
          },
          child: Container(
            child: Icon(
              provider.currentLocale == 'en'
                  ? Icons.skip_next
                  : Icons.skip_previous,
              color: (provider.isDarkModeEnabled()
                  ? Colors.amberAccent
                  : Colors.black),
              size: 50,
            ),
          ),
        ),
      ],
    );
  }

  play() {
    print(index);
    audioPlayer.play(widget.radios[index].radioUrl);
  }

  stop() {
    audioPlayer.stop();
  }
}
