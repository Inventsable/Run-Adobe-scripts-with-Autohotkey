# Using AHK to execute Adobe scripts:

[Recently saw a forum post asking about adding the ability to use F13 - F24 keys to trigger Illustrator actions](https://community.adobe.com/t5/illustrator-discussions/f-keys-to-run-actions-are-full-any-other-option/td-p/12838118), which led me to think about using [AutoHotKey](https://www.autohotkey.com/) to remotely execute an Adobe script, and want to document this for myself and any one else curious. AHK is for Windows only, but COM is available in many different languages and the principle should be the same regardless of OS.

We can write a simple JSX script (for Illustrator here):

```js
app.doScript("someAction", "someActionSet"); // Executes an Illustrator Action
```

Then we can use either use COM objects in AHK to remotely execute this script in any way we'd like:

```ahk
; Default AHK header / auto-execute section
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; Create a COM object:
com := ComObjCreate("Illustrator.Application")

; And execute on any given keypress or programmatic trigger:
F1::
  com.DoJavaScriptFile("C:\Users\TRSch\OneDrive\Documents\Adobe Scripts\testScript.jsx") ; Execute target script
return
```

Or execute them directly via `Run` command:

````ahk
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
```

The above runs our Illustrator script every time I press the F1 key. You can further customize it to only do so if Illustrator is the active window, to launch AI if not already open beforehand, to only do this with certain modifier keys, and a lot more.

AHK is incredibly flexible and can trigger code through virtually any hotkey, combination of hotkeys, hotstrings (typed words/phrases like "hello world"), sequences of keys and beyond. It's far more robust than what Adobe provides and gives you very low-level (technical, close to hardware) control of automation, so knowing how to do this could be very useful for Adobe power-users.
````
