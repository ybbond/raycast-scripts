#!/usr/bin/osascript

# How to use this script?
# It's a template which needs further setup. Duplicate the file,
# remove `.template.` from the filename,
# Replace all instances of <Monitor> with the name of your desired audio output device
# Replace all instances of <Orientation> with your desired value (90, 180, 270)

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Flip Screen <Orientation>
# @raycast.mode silent

# Optional parameters:
# @raycast.packageName Monitor

# Documentation:
# @raycast.description Flip the <Monitor> orientation to <Orientation>¡.

use scripting additions

set monitorName to "<Monitor>"
set orientationTarget to "<Orientation>¡"

if running of application "System Preferences" then
	quit application "System Preferences"
end if

tell application "System Preferences"
	activate
	reveal anchor "displaysDisplayTab" of pane id "com.apple.preference.displays"
end tell

tell application "System Events" to tell process "System Preferences"
	display notification "Starting"
	set currentCount to 0
	repeat while currentCount < 5
		display notification "Inside first 'repeat' loop. Run for" & space & currentCount & space & "times"
		if exists tab group 1 of window monitorName then
			set currentCount to 5
		else
			delay 0.5
			set currentCount to currentCount + 1
		end if
	end repeat
	tell window monitorName
		tell tab group 1
			tell pop up button 2
				if (value) contains "Standard" then
					display notification "value is Standard"
					click
					click menu item orientationTarget of menu 1
				else
					display notification "value is not Standard, reverting to Standard"
					click
					click menu item "Standard" of menu 1
				end if
			end tell
		end tell
	end tell
	
end tell

tell application "System Preferences"
	quit
end tell

tell application "System Events"
	quit
end tell