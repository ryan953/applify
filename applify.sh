#!/usr/bin/env bash

###
# Usage:
# $ ./appify your-shell-script.sh "Your App Name"
#
# 1. Create an .icns file or a 512×512 PNG image with the icon you want, and copy it to the clipboard (⌘ + C). (Alternatively, copy it from an existing app as described in steps 2 and 3.)
# 2. Right-click the .app file of which you want to change the icon and select “Get Info” (or select the file and press ⌘ + I).
# 3. Select the app icon in the top left corner by clicking it once. It will get a subtle blue outline if you did it right.
# 4. Now hit ⌘ + V (paste) to overwrite the default icon with the new one.
#
#
# https://elliotekj.com/2014/05/27/how-to-create-high-resolution-icns-files/
# icon_16x16.png icon_16x16@2x.png icon_32x32.png icon_32x32@2x.png icon_128x128.png icon_128x128@2x.png icon_256x256.png icon_256x256@2x.png icon_512x512.png icon_512x512@2x.png
# iconutil -c icns AppIcon.iconset
#
#
#
# in your info.plist add
# ```
# <key>CFBundleIconFile</key>
# <string>iconfile</string>
# ```
# with icon file iconfile.icns in your ./Contents/Resources directory
#
#
#
# Try re-registering your application with Launch Services: /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -f /Applications/MyTool.app
###

APPNAME=${2:-$(basename "${1}" '.sh')};
DIR="${APPNAME}.app/Contents/MacOS";

if [ -a "${APPNAME}.app" ]; then
    echo "${PWD}/${APPNAME}.app already exists :(";
    exit 1;
fi;

mkdir -p "${DIR}";
cp "${1}" "${DIR}/${APPNAME}";
chmod +x "${DIR}/${APPNAME}";

echo "${PWD}/$APPNAME.app";
