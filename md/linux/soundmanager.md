<div>

</div>

## Sound Manager

Alsa connects the audio card and the operating system. It also provides
an sound controller, i.e an user interface called alsamixer, to tweak
the volume. Another sound controller is pulseaudio. Pulseaudio still
uses Alsa for audio card and OS communication.

Jack is a more advanced sound controller. Where any given application
makes use of sound control will be up to the application developers.
Some applications will only use ALSA, some need PulseAudio, some need
JACK.

pavucontrol is the front end for this sound controlers (a volume
controller).

### Source

[Alsa, Pulseaudio, Jack: Desktop and
Applications](https://askubuntu.com/questions/426983/how-can-i-tell-if-im-using-alsa-or-pulse-audio-by-default-switching-to-i3-wm)
