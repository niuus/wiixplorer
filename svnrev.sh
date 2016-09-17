#! /bin/bash
#
rev_new_raw=$(svnversion -n . 2>/dev/null | tr '\n' ' ' | tr -d '\r')
[ -n "$rev_new_raw" ] || rev_new_raw=$(SubWCRev . 2>/dev/null | tr '\n' ' ' | tr -d '\r')


rev_new_raw=$(echo $rev_new_raw | sed 's/[^0-9]*\([0-9]*\)\(.*\)/\1 \2/')
rev_new=0
a=$(echo $rev_new_raw | sed 's/\([0-9]*\).*/\1/')
let "a+=0"
#find max rev
while [ "$a" ]; do
	[ "$a" -gt "$rev_new" ] && rev_new=$a
	rev_new_raw=$(echo -n $rev_new_raw | sed 's/[0-9]*[^0-9]*\([0-9]*\)\(.*\)/\1 \2/')
	a=$(echo $rev_new_raw | sed 's/\([0-9]*\).*/\1/')
done

rev_old=$(cat ./source/svnrev.c 2>/dev/null | tr -d '\n' | sed 's/[^0-9]*\([0-9]*\).*/\1/')

if [ "$rev_new" != "$rev_old" ] || [ ! -f ./source/svnrev.c ]; then

	cat <<EOF > ./source/svnrev.c
#define SVN_REV "$rev_new"

const char * SvnRev()
{
	return SVN_REV;
}
EOF

	if [ -n "$rev_new" ]; then
		echo "Changed Rev $rev_old to $rev_new" >&2
	else
		echo "svnrev.c created" >&2
	fi
	echo >&2

fi

	rev_new=`expr $rev_new + 1`
	rev_date=`date +%Y%m%d%H%M -u`

	cat <<EOF > ./HBC/meta.xml
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<app version="1">
  <name>WiiXplorer</name>
  <coder>Dimok</coder>
  <contributors>r-win/dude</contributors>
  <version>r$rev_new</version>
  <release_date>$rev_date</release_date>
  <no_ios_reload/>
  <ahb_access/>
  <short_description>Wii File Browser</short_description>
  <long_description>A multi device file explorer for the Wii by dimok, r-win and dude.
The GUI is done with libwiigui as base and graphics by NeoRame.

Features:
 * USB2 support with IOS58 or any common cIOS installed
 * SMB/USB/SD/DVD recursive copy/move/delete
   of files/directories with all files in it
 * FAT/NTFS/EXT2/EXT3/EXT4 files systems support
 * GUID Partition Table (GPT) support
 * Rename files/directories
 * Properties of files/directories
 * Browse through SD/USB/SMB/DVD/WiiDisk
 * Addressbar with path
 * Multilanguage with custom font support
 * Boot .dol/.elf files
 * Playback Wii/GC Game Videos
 * Stylish Music Player
 * Open TXT/XML/MP3/OGG/WAV/BNS/AIFF files
 * Supported Image Formats:
   PNG/JPEG/GIF/BMP/TPL/TGA/TIFF/GD/GD2
 * Imageoperations zoom/slideshow
 * Image converter which converts the
   supported formats to:
   PNG/JPEG/GIF/BMP/TIFF/GD/GD2
 * Screenshot support at any point of the app
   in different formats
 * ZIP/7zip/RAR/BNR/U8Archive/RARC browsing and decompressing
 * Properties of archive files
 * Add files/directories to a ZIP or create new ZIP files
 * Textediting support
 * USB Keyboard support
 * PDF Viewing support
 * Format SD/USB primary/logical partitions to FAT32
 * Integrated FTP Server and FTP Client
 * MD5 Calculator and Logger
 * Start BootMii
 * Auto-Update feature

Credits:
  Coding: Dimok
  Contributors: r-win, dude
  Forwarder: Dimok
  Channel: Dj Skual
  Artworks: Neorame
  Languages: Dj Skual and Translaters

  Libwiigui: Tantric
  Libogc/Devkit: Shagkur and Wintermute
  FreeTypeGX: Armin Tamzarian.

Links:
  WiiXplorer Project Page:
	http://code.google.com/p/wiixplorer/
  WiiXplorer Support Site:
	http://code.google.com/p/wiixplorer/
	updates/list
  Libwiigui Website:
	http://wiibrew.org/wiki/Libwiigui/
  FreeTypeGX Project Page:
	http://code.google.com/p/freetypegx/
  Gettext Official Page:
	http://www.gnu.org/software/gettext/
	gettext.html
  Languages Page:
	http://gbatemp.net/
	index.php?showtopic=174053
  </long_description>
</app>
EOF

echo $a
