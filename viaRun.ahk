#NoEnv 
;#Warn ;Enable warnings to assist with detecting common errors.
SendMode Input 
#SingleInstance force

#IfWinActive ahk_class illustrator
  F1:: RunScript("Script_1.jsx") 
  F2:: RunScript("Script_2.jsx")

  RunScript(script)
  {
    ;Main script folder
    FullPath := "d:\Resources\Scripts\Illustrator\" . script
    Run Illustrator.exe %FullPath% , ,Max
    return
  }