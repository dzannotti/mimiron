#!/bin/bash

# Update desktop database
update-desktop-database ~/.local/share/applications 2>/dev/null || true

# Open all images with gthumb (GNOME image viewer)
xdg-mime default org.gnome.gThumb.desktop image/png
xdg-mime default org.gnome.gThumb.desktop image/jpeg
xdg-mime default org.gnome.gThumb.desktop image/gif
xdg-mime default org.gnome.gThumb.desktop image/webp
xdg-mime default org.gnome.gThumb.desktop image/bmp
xdg-mime default org.gnome.gThumb.desktop image/tiff
xdg-mime default org.gnome.gThumb.desktop image/svg+xml

# Open PDFs with Evince
xdg-mime default org.gnome.Evince.desktop application/pdf

# Use Google Chrome as the default browser
xdg-settings set default-web-browser google-chrome.desktop
xdg-mime default google-chrome.desktop x-scheme-handler/http
xdg-mime default google-chrome.desktop x-scheme-handler/https
xdg-mime default google-chrome.desktop text/html

# Open video files with mpv
xdg-mime default mpv.desktop video/mp4
xdg-mime default mpv.desktop video/x-msvideo
xdg-mime default mpv.desktop video/x-matroska
xdg-mime default mpv.desktop video/x-flv
xdg-mime default mpv.desktop video/x-ms-wmv
xdg-mime default mpv.desktop video/mpeg
xdg-mime default mpv.desktop video/ogg
xdg-mime default mpv.desktop video/webm
xdg-mime default mpv.desktop video/quicktime
xdg-mime default mpv.desktop video/3gpp
xdg-mime default mpv.desktop video/3gpp2
xdg-mime default mpv.desktop video/x-ms-asf
xdg-mime default mpv.desktop video/x-ogm+ogg
xdg-mime default mpv.desktop video/x-theora+ogg
xdg-mime default mpv.desktop application/ogg

# Open audio files with mpv
xdg-mime default mpv.desktop audio/mpeg
xdg-mime default mpv.desktop audio/mp4
xdg-mime default mpv.desktop audio/ogg
xdg-mime default mpv.desktop audio/flac
xdg-mime default mpv.desktop audio/x-wav

# Open text files with GNOME Text Editor or gedit
xdg-mime default org.gnome.TextEditor.desktop text/plain

# Archives with file-roller
xdg-mime default org.gnome.FileRoller.desktop application/zip
xdg-mime default org.gnome.FileRoller.desktop application/x-tar
xdg-mime default org.gnome.FileRoller.desktop application/x-compressed-tar
xdg-mime default org.gnome.FileRoller.desktop application/x-bzip-compressed-tar
xdg-mime default org.gnome.FileRoller.desktop application/x-xz-compressed-tar
xdg-mime default org.gnome.FileRoller.desktop application/x-7z-compressed
xdg-mime default org.gnome.FileRoller.desktop application/x-rar
xdg-mime default org.gnome.FileRoller.desktop application/gzip

# More audio formats with mpv
xdg-mime default mpv.desktop audio/x-m4a
xdg-mime default mpv.desktop audio/aac
xdg-mime default mpv.desktop audio/opus
xdg-mime default mpv.desktop audio/x-opus+ogg

# HEIF/HEIC images (iPhone photos) with gthumb
xdg-mime default org.gnome.gThumb.desktop image/heif
xdg-mime default org.gnome.gThumb.desktop image/heic
