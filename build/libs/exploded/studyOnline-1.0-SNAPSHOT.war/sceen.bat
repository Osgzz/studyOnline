start
ffmpeg.exe -i %1 -ss 20 -vframes 1 -r 1 -ac 1 -ab 2 -s 640*264 -f  image2 %2
exit