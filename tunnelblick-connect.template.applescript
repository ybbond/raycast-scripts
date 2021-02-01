#!/usr/bin/osascript

# How to use this script?
# It's a template which needs further setup. Duplicate the file,
# remove `.template.` from the filename,
# Replace all instances of <VPN> with the name of your VPN on Tunnelblick

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Connect <VPN>
# @raycast.mode silent

# Optional parameters:
# @raycast.packageName Tunnelblick

# Documentation:
# @raycast.description Open Tunnelblick and connect to <VPN> VPN.

set vpnName to "<VPN>"

tell application "Tunnelblick"
	connect vpnName
	get state of first configuration where name = vpnName
	repeat until result = "CONNECTED"
		delay 1
		get state of first configuration where name = vpnName
	end repeat
end tell