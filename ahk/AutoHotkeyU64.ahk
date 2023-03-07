#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;HYPER HOTKEYS

^+!;:: ;Spotify
Run, C:\Users\lui.laskowski\AppData\Roaming\Spotify\Spotify.exe
return

^+!w:: ;Calc
Run, calc
return

^+!q:: ;Close
Send, !{F4}
return

^+!b:: ;Browser
Run, chrome.exe "chrome-extension://jdbnofccmhefkmjbkkdkfiicjkgofkdh/html/newtab.html"
return

^+!j:: ;Downloads
Run, C:\Users\lui.laskowski\Downloads
return

^+!f:: ;Reed
Run, "https://reed.t-realestate.com/apps/reed"
return

^+!u:: ;Undesktop
Run, chrome.exe "https://undesktop.t-mobile.com"
Sleep, 100
Send, +{Tab}
return

^+!p:: ;Abstractions tracker
Run, C:\Users\lui.laskowski\Desktop\Abstractions Tracker.url
return

^+!t:: ;Teams
Run, C:\Users\lui.laskowski\AppData\Local\Microsoft\Teams\Update.exe --processStart "Teams.exe"
return

^+!y:: ;Hours spreadsheet
runHours()
return

^+!n:: ;OneNote
Run, onenote-cmd://
return

^+!e:: ;Explorer
Run, explorer
return

^+!o:: ;Outlook
Run, outlook
return

^+!i:: ;iAM
Run, https://iamcbre.com/login
return

^+!z:: ;Typing
Run, https://monkeytype.com/
return

^+!k:: ;Calculator
Run, excel
return

^+!l:: ;Word
Run, winword
return

;MEDIA

^+!,:: ;VolDown
Send {Volume_Down 2}
return

^+!.:: ;VolUp
Send {Volume_Up 2}
return

^+!Down:: ;PlayPause
Send {Media_Play_Pause}
return

^+!Left:: ;MediaPrev
Send {Media_Prev}
return

^+!Right:: ;MediaNext
Send {Media_Next}
return

;FUNCTION BUTTON HOTKEYS

F17:: ; Left desktop
LongPress("F17", "#^{Left}", "#^{F4}")
return

F18:: ; Show desktop
Send, #d
return

F19:: ; Right desktop
LongPress("F19", "#^{Right}", "#^d")
return

F20:: ; Desktop management
Send, {LWin down}{Tab}{Lwin up}

F21:: ; Move window to other monitor and left half of screen.
Send, {LWin down}{Left}{Lwin up}
Sleep, 100
Send, {Esc}
return

F22:: ; Move window to other monitor and maximize.
Send, #+{Right}
Sleep, 100
WinMaximize, A
return

F23:: ; Move window to other monitor and right half of screen.
Send, {LWin down}{Right}{Lwin up}
Sleep, 100
Send, {Esc}
return

F24:: ; Screenshot
Send, +#s
return

;SCRIPT FUNCTIONS

; Function to send single or double press
LongPress(key, sendShort, sendLong)
{
    KeyWait, %key%, T0.4
    If ErrorLevel {
        Send, %sendLong%
        KeyWait, %key%
    } Else {
        Send, %sendShort%
    }
}

; Function to run hours spreadsheet
runHours()
{
Folder = C:\Users\lui.laskowski\Desktop\Horas
Loop, %Folder%\*
{
     FileGetTime, Time, %A_LoopFileFullPath%, C
     If (Time > Time_Orig)
     {
          Time_Orig := Time
          File := A_LoopFileName
     }
}
Run, %Folder%\%File%
}
