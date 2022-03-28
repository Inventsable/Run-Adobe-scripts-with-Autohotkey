#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

com := ComObjCreate("Illustrator.Application") ; create COM object

F1:: ; Triggered on F1 keypress:
  com.DoJavaScriptFile("C:\Users\TRSch\OneDrive\Documents\Adobe Scripts\testAlert.jsx") ; Execute target script
return