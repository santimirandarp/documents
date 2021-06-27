# Images

-   Dwld iso using `zsync http://cdimage.ubuntu.com/path/to/distro.iso.zsync` or `http http://cdimage.ubuntu.com/path/to/img.iso` or bit torrent.
-   Make it bootable: *Etcher*, *Unetbootin*.

Small user-scoped script under *.local/bin* for automated download of isos, to have always the most recent one:

```
# cat ~/.local/bin/dwld_OSs.sh 
distroName="focal"
base="http://cdimage.ubuntu.com"
desktop="$base/$distroName/daily-live/current"
server="$base/ubuntu-server/$distroName/daily-live/current"

zsync "$server/$distroName-live-server-amd64.iso.zsync"
zsync "$server/$distroName-live-server-arm64.iso.zsync"
zsync "$desktop/$distroName-desktop-amd64.iso.zsync"

```
