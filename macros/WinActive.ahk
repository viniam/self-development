#IfWinActive ahk_exe Illustrator.exe
    $XButton1::
        Send, {F3}
    Return

    $XButton2::
        Send, !^{Numpad0}
        Sleep, 100
        Send, ^{Tab}
    Return
#IfWinActive

#IfWinActive ahk_exe inDesign.exe
    $WheelUp::
        BlockInput, On
        SendInput !{PGUP}
        BlockInput, Off
    Return

    $WheelDown::
        BlockInput, On
        SendInput !{PGDN}
        BlockInput, Off
    Return

    $!+WheelDown::SpamLeftClicks()

    $!+WheelUp::SpamLeftClicks()
#IfWinActive

#IfWinActive ahk_exe Photoshop.exe
    $XButton1::
        Send, {F10}
    Return

    $XButton2::
        Send, {u}
    Return

    $MButton::
        Send, ^{0}
        Sleep, 333
        Send, ^{Tab}
    Return

    $+WheelUp::
        BlockInput On
        Send, {LControl down}{Tab}{LControl up}
        BlockInput Off
    Return

    $+WheelDown::
        BlockInput On
        Send, {LControl down}{LShift down}{Tab}{LControl up}{LShift up}
        BlockInput Off
    Return
#IfWinActive

#IfWinActive ahk_exe Warframe.x64.exe
    $^Numpad1::
        Sendinput, {Text}%email_tg%
        Sleep, 100
        Send {Tab}
        Sleep, 50
        Sendinput, {Text}%password_wf_tg%
    Return

    $^Numpad2::
        Sendinput, {Text}%email_vd%
        Sleep, 100
        Send {Tab}
        Sleep, 50
        Send, {Text}%password_wf_vd%
    Return

    $^Numpad3::
        Sendinput, {Text}%email_gcc%
        Sleep, 100
        Send {Tab}
        Sleep, 50
        Sendinput, {Text}%password_wf_gcc%
    Return

    $XButton1::
        Send, {Ctrl down}
        Sleep, 1
        Send, {Space down}
        Sleep, 1
        Send, {Space up}
        Send, {Ctrl up}
        Sleep, 100
        ; Roll after Bullet Jump
        Send, {Shift down}
        Sleep, 1
        Send, {Space down}
        Sleep, 1
        Send, {Space up}
        Send, {Shift up}
        Sleep 400
    Return

    $!XButton1::
        Send, {Ctrl down}
        Sleep, 1
        Send, {Wheelup down}
        Sleep, 1
        Send, {Ctrl up}
        Sleep 300
    Return

    $!XButton2::
        Send, 5
        Sleep, 200
        Send, {Ctrl Down}
        Sleep, 200
        Send, {Space}
        Sleep, 200
        Send {Ctrl Up}
        Sleep, 200
        Send, 5
    Return
#IfWinActive

#IfWinActive ahk_exe RiotClientUx.exe
    $^Numpad1::
        Sendinput, {Text}%username_px_riot%
        Sleep, 100
        Send {Tab}
        Sleep, 50
        Send, {Text}%password_px_riot%
    Return

    $^Numpad2::
        Sendinput, {Text}%username_mz_riot%
        Sleep, 100
        Send {Tab}
        Sleep, 50
        Send, {Text}%password_mz_riot%
    Return
#IfWinActive

#IfWinActive ahk_exe Diablo III64.exe
    $^!LButton::EnterClick() ; Bind function to Ctrl+Alt+LButton hotkey

    ^LButton::SpamClick("LButton") ; Bind function to Ctrl+LButton hotkey

    ^RButton::SpamClick("RButton") ; Bind function to Ctrl+RButton hotkey

    ^XButton2:: UrshiEnchant() ; Bind function to Ctrl+XButton2 hotkey

    !XButton2:: SpeedEnchant() ; Bind function to Alt+XButton2 hotkey

    $^WheelDown::SpamRightClicks() ; Bind function to Ctrl+WheelDown hotkey

    $^WheelUp::SpamRightClicks() ; Bind function to Ctrl+WheelUp hotkey
#IfWinActive

#IfWinActive ahk_exe PathOfExile.exe ; https://github.com/nidark/Poe-Companion/blob/master/PoeCompanion.ahk
    $^Numpad1::
        Sendinput, {Text}%password_poe%
    Return

    $+F11::
        Send, {LButton}{Enter}
    Return

    $MButton::GoHome()

    $XButton1::SpamPots()

    $!WheelUp::Send {Left}
    $^WheelUp::SpamLeftClicks()
    $+WheelUp::SpamLeftClicks()

    $!WheelDown::Send {Right}
    $^WheelDown::SpamLeftClicks()
    $+WheelDown::SpamLeftClicks()
#IfWinActive

#IfWinActive ahk_exe opera.exe
    SetKeyDelay, 50 ; Set a delay of 50 milliseconds between each keystroke
    $!WheelUp:: ; Cicle Up a tab
        BlockInput, On
        Send, {LControl down}{LShift down}{Tab}{LControl up}{LShift up}
        BlockInput, Off
    Return

    $!WheelDown:: ; Cicle Down a tab
        BlockInput, On
        Send, {LControl down}{Tab}{LControl up}
        BlockInput, Off
    Return

    ~$Alt:: ; Disable Alt
        BlockInput, On
        KeyWait, Alt
        BlockInput, Off
    Return
#IfWinActive

#IfWinActive ahk_exe Code.exe
    SetKeyDelay, 50 ; Set a delay of 50 milliseconds between each keystroke
    $!WheelUp:: ; Cicle Up a tab
        BlockInput, On
        Send, {LControl down}{LShift down}{Tab}{LControl up}{LShift up}
        BlockInput, Off
    Return

    $!WheelDown:: ; Cicle Down a tab
        BlockInput, On
        Send, {LControl down}{Tab}{LControl up}
        BlockInput, Off
    Return

    ~$Alt:: ; Disable Alt
        BlockInput, On
        KeyWait, Alt
        BlockInput, Off
    Return
#IfWinActive

; Function to spam Left clicks
SpamLeftClicks(){
    BlockInput On
    Send {Blind}{LButton down}{LButton up}
    BlockInput Off
}

; Function to spam right clicks
SpamRightClicks(){
    BlockInput On
    Send {Blind}{RButton down}{RButton up}
    BlockInput Off
}

; Function to press LButton and Enter
EnterClick(){
    Send, {LButton}{Enter}
}

; Function to spam the key while holding
SpamClick(key) {
    while (GetKeyState(key, "P")) {
        if (key = "LButton") {
            MouseClick, Left
        } else if (key = "RButton") {
            MouseClick, Right
        } else {
            return ; Exit function if invalid key is provided
        }
    }
}

; Function to enchant on Mystic faster
SpeedEnchant() {
    MouseGetPos, PosX, PosY ; Save current mouse position
    MouseMove, 265, 785, 0 ; Move mouse to the Enchant button location
    Sleep, 50
    MouseClick, Left
    MouseMove, %PosX%, %PosY% ; Move mouse back to the original position
}

; Function to perform the Urshi Enchants
UrshiEnchant() {
    EnchantLoop(2) ; Perform two enchant loops for the first two enchants
    Send {T} ; Start returning to town
    EnchantLoop(3) ; Perform three enchant loops for the last three enchants
    MouseMove, 900, 500 ; Move mouse to the middle of the screen
}

; Helper function to perform a single Enchant loop
EnchantLoop(n) {
    Loop, %n% {
        MouseMove, 270, 545, 0 ; Move mouse to the enchant button location
        MouseClick, Left
        Sleep 1500
    }
}

; Function to spam pots one at the time
SpamPots(){
    BlockInput On

    global Flask
    Send %Flask%
    Flask += 1

    BlockInput Off

    If Flask > 5
        Flask = 3
    Return
}

; Function to open a Portal Scroll
GoHome(){
    BlockInput On

    RandomSleep(110, 220)

    MouseGetPos xx, yy
    Send {'}
    RandomSleep(50, 70)

    MouseMove, 1871, 820, 0
    RandomSleep(50, 150)

    Click Right
    RandomSleep(50, 150)

    Send {'}
    MouseMove, xx, yy, 0

    BlockInput Off
    Return
}

; Function to generate a random number between min and max
RandomSleep(min, max){
    Random, r, %min%, %max%
    r:=floor(r/Speed)
    Sleep %r%
    Return
}
; ^ Ctrl
; ! Alt
; + Shift
; # Win
