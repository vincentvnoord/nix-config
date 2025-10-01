gphoto2 --stdout --capture-movie | \
ffmpeg -f mjpeg -i - \
  -vf "format=yuv420p" \
  -vcodec rawvideo \
  -f v4l2 /dev/video0
