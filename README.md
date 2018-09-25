# update-dropbox-jamf

Based on update-chrome-sh by LewisLebentz https://gist.github.com/LewisLebentz/980acccde324da79c6cfd24472c3ee4d#file-update-chrome-sh

But less elegant. Checks Jamf for latest reported version at https://www.jamf.com/jamf-nation/third-party-products/56/dropbox?view=info, then attempts to download the dmg from Dropbox.

This is meant to break at some point.
Tested on macOS 10.12.x and 10.13.x, meant for distribution via Jamf tools
