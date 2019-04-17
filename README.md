# TestGetAttachedDisplayResolutions
A quick hacked together test to confirm an answer for Stack Overflow question:

  https://stackoverflow.com/questions/53064744/how-to-get-all-possible-screen-resolutions-in-cocoa/53161200
  
***Don't ship this code as-is without auditing it and cleaning it up!***

The question asked how to get all the possible resolutions for attached monitors like is shown in the 
Displays Settings panel if you hold the option key down when selecting "Scaled" for Resolution.

Here's the sample output from my system with a MBP and two external monitors:

    2019-04-17 00:27:43.345265-0700 test[11166:1070188] 
    Display 12: external, main
    2019-04-17 00:27:43.345484-0700 test[11166:1070188] points: (2560 x 1440), pixels: (2560, 1440)
    2019-04-17 00:27:43.345517-0700 test[11166:1070188] points: (1280 x 720), pixels: (1280, 720)
    2019-04-17 00:27:43.345538-0700 test[11166:1070188] points: (800 x 600), pixels: (800, 600)
    2019-04-17 00:27:43.345557-0700 test[11166:1070188] points: (1024 x 768), pixels: (1024, 768)
    2019-04-17 00:27:43.345578-0700 test[11166:1070188] points: (1280 x 960), pixels: (1280, 960)
    2019-04-17 00:27:43.345598-0700 test[11166:1070188] points: (1344 x 1008), pixels: (1344, 1008)
    2019-04-17 00:27:43.345618-0700 test[11166:1070188] points: (1344 x 756), pixels: (1344, 756)
    2019-04-17 00:27:43.345637-0700 test[11166:1070188] points: (1600 x 1200), pixels: (1600, 1200)
    2019-04-17 00:27:43.345656-0700 test[11166:1070188] points: (1600 x 900), pixels: (1600, 900)
    2019-04-17 00:27:43.345673-0700 test[11166:1070188] points: (2048 x 1152), pixels: (2048, 1152)
    2019-04-17 00:27:43.345787-0700 test[11166:1070188] 
    Display 6: builtin,
    2019-04-17 00:27:43.345874-0700 test[11166:1070188] points: (2880 x 1800), pixels: (2880, 1800)
    2019-04-17 00:27:43.345904-0700 test[11166:1070188] points: (1440 x 900), pixels: (1440, 900)
    2019-04-17 00:27:43.345924-0700 test[11166:1070188] points: (3360 x 2100), pixels: (3360, 2100)
    2019-04-17 00:27:43.345942-0700 test[11166:1070188] points: (2560 x 1600), pixels: (2560, 1600)
    2019-04-17 00:27:43.345961-0700 test[11166:1070188] points: (2048 x 1280), pixels: (2048, 1280)
    2019-04-17 00:27:43.345981-0700 test[11166:1070188] points: (1650 x 1050), pixels: (1650, 1050)
    2019-04-17 00:27:43.346001-0700 test[11166:1070188] points: (1280 x 800), pixels: (1280, 800)
    2019-04-17 00:27:43.346021-0700 test[11166:1070188] points: (1152 x 720), pixels: (1152, 720)
    2019-04-17 00:27:43.346040-0700 test[11166:1070188] points: (1024 x 768), pixels: (1024, 768)
    2019-04-17 00:27:43.346060-0700 test[11166:1070188] points: (800 x 600), pixels: (800, 600)
    2019-04-17 00:27:43.346178-0700 test[11166:1070188] 
    Display 16: external,
    2019-04-17 00:27:43.354233-0700 test[11166:1070188] points: (1920 x 1200), pixels: (1920, 1200)
    2019-04-17 00:27:43.354276-0700 test[11166:1070188] points: (960 x 600), pixels: (960, 600)
    2019-04-17 00:27:43.354300-0700 test[11166:1070188] points: (800 x 600), pixels: (800, 600)
    2019-04-17 00:27:43.354318-0700 test[11166:1070188] points: (1024 x 768), pixels: (1024, 768)
    2019-04-17 00:27:43.354333-0700 test[11166:1070188] points: (1024 x 640), pixels: (1024, 640)
    2019-04-17 00:27:43.354352-0700 test[11166:1070188] points: (1280 x 960), pixels: (1280, 960)
    2019-04-17 00:27:43.354369-0700 test[11166:1070188] points: (1280 x 800), pixels: (1280, 800)
    2019-04-17 00:27:43.354386-0700 test[11166:1070188] points: (1344 x 1008), pixels: (1344, 1008)
    2019-04-17 00:27:43.354405-0700 test[11166:1070188] points: (1344 x 840), pixels: (1344, 840)
    2019-04-17 00:27:43.354424-0700 test[11166:1070188] points: (1600 x 1200), pixels: (1600, 1200)
    2019-04-17 00:27:43.354445-0700 test[11166:1070188] points: (1600 x 1000), pixels: (1600, 1000)
