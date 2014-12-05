function Main()
{
  try
  {
    // Enter your code here. 
  }
  catch(exception)
  {
    Log.Error("Exception", exception.description);
  }
}

function Test2()
{  
  var text = makeString();
  TestedApps.RunAll();
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Open...");
  Aliases.notepad.dlgOpen.OpenFile("C:\\klimova\\test1.txt", "Text Documents (*.txt)");
  Aliases.notepad.wndNotepad.Edit.Keys("[Caps]^A[BS]");
  Aliases.notepad.wndNotepad.Edit.Keys(text); 
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Save");
  Aliases.notepad.wndNotepad.Close();
  TestedApps.RunAll();
  Aliases.notepad.wndNotepad.MainMenu.Click("File|Open...");
  Aliases.notepad.dlgOpen.OpenFile("C:\\klimova\\test1.txt", "Text Documents (*.txt)");
  aqObject.CompareProperty(Aliases.notepad.wndNotepad.Edit.wText, 0, text); 
  Aliases.notepad.wndNotepad.Close();
}

function makeString(){
 var text = "";
 var possible="qwertyuiopasdfghjklzxcvbnm1234567890";
 for(var i = 0;i<5;i++)
 text+=possible.charAt(Math.floor(Math.random()*possible.length));
 return text;
 
}
