#Include <JSON>

Numpad0::
    FileRead jsonString, settings.json
    Settings := JSON.Load(jsonString)

    ; Setttings
    StartX := Settings.startPoint.x
    StartY := Settings.startPoint.y
    EndX := Settings.endPoint.x
    EndY := Settings.endPoint.y
    Blocksize := Settings.blockSize
    SleepTime := Settings.sleepTime
    ScreenshotSize := Settings.screenshotSize
    ZoomFactor := Settings.zoomFactor
    ChatOpenChar := Settings.chatOpenChar
    ; Global variables
    CurrX := StartX
    CurrY := StartY
    IterationStep := 0
    Direction := 0

    ; General setup
    Send %ChatOpenChar%/c game.speed=0.5{Enter}
    Send %ChatOpenChar%/c game.player.character=nil{Enter}
    Send %ChatOpenChar%/c game.player.surface.freeze_daytime=true{Enter}
    Send %ChatOpenChar%/c game.player.surface.always_day=true{Enter}

    ; All other screenshots
    Loop{
        Send %ChatOpenChar%/c game.player.teleport({{}%CurrX%,%CurrY%{}}){Enter}
        Sleep 1000*3
        Send %ChatOpenChar%/screenshot %ScreenshotSize% %ScreenshotSize% %ZoomFactor%{Enter}
        Sleep Sleeptime


        if(CurrX < endX){
            CurrX := currX + BlockSize
        } else {
            CurrX := StartX
            CurrY := CurrY + BlockSize
        }

        if(Curr Y > EndY){
            MsgBox The screenshots were taken successfully
            break
        }

        continue
    }
