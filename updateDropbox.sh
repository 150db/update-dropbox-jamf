#!/bin/bash

dmgfile="Dropbox.dmg"
volname="Dropbox Installer"
logfile="/Library/Logs/DropboxInstallScript.log"
ver=$(curl -s "https://www.jamf.com/jamf-nation/third-party-products/56/dropbox?view=info" | grep "Current Version" | awk '{print substr($3,10);}')
url="https://clientupdates.dropboxstatic.com/dbx-releng/client/Dropbox%20${ver}.dmg"


/bin/echo "--" >> ${logfile}
/bin/echo "`date`: Downloading latest version." >> ${logfile}
/usr/bin/curl -s -o /tmp/${dmgfile} ${url}
/bin/echo "`date`: Mounting installer disk image." >> ${logfile}
/usr/bin/hdiutil attach /tmp/${dmgfile} -nobrowse -quiet
/bin/echo "`date`: Installing..." >> ${logfile}
ditto -rsrc "/Volumes/${volname}/Dropbox.app" "/Applications/Dropbox.app"
/bin/sleep 10
/bin/echo "`date`: Unmounting installer disk image." >> ${logfile}
/usr/bin/hdiutil detach $(/bin/df | /usr/bin/grep "${volname}" | awk '{print $1}') -quiet
/bin/sleep 10
/bin/echo "`date`: Deleting disk image." >> ${logfile}
/bin/rm /tmp/"${dmgfile}"

exit 0
