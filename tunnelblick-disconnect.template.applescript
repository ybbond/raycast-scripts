#!/usr/bin/osascript

# How to use this script?
# It's a template which needs further setup. Duplicate the file,
# remove `.template.` from the filename,
# Replace all instances of <VPN> with the name of your VPN on Tunnelblick

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Disconnect <VPN>
# @raycast.mode silent

# Optional parameters:
# @raycast.packageName Tunnelblick

# Documentation:
# @raycast.description Disconnect <VPN> VPN and quit Tunnelblick

set vpnName to "<VPN>"

tell application "Tunnelblick"
	disconnect vpnName
	get state of first configuration where name = vpnName
	repeat until result = "EXITING"
		delay 1
		get state of first configuration where name = vpnName
	end repeat
	quit
end tell