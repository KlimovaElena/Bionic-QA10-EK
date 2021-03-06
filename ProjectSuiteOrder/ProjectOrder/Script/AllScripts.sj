function Test(){
 OpenOrder();
 DDTCreate();
 editOrder();
 DeleteOrder();
 Close();
}

function OpenOrder(){
TestedApps.RunAll();
}

function DDTCreate(){
  
  DDT.CSVDriver(Files.FileNameByName("data.txt"));
  var visaCard = Aliases.Group.Visa;
  var masterCard = Aliases.Group.MasterCard;
  var ae = Aliases.Group.AmericanExpress;
  for(var i=0;i<=4;i++){
        Log.AppendFolder("order "+i);
        Aliases.Orders.MainForm.MainMenu.Click("Orders|New order...");         
         Aliases.Group.CustomerName.wText = DDT.CurrentDriver.Value("CustomerName");
         Aliases.Group.Quantity.wValue = DDT.CurrentDriver.Value("Quantity");
         Aliases.Group.Date.wDate = DDT.CurrentDriver.Value("Date");
         Aliases.Group.Street.wText = DDT.CurrentDriver.Value("Street");
         Aliases.Group.State.wText = DDT.CurrentDriver.Value("State");
         Aliases.Group.City.wText = DDT.CurrentDriver.Value("City");
         Aliases.Group.Zip.wText = DDT.CurrentDriver.Value("Zip");
         Aliases.Group.CardNo.wText = DDT.CurrentDriver.Value("CardNo");
         var card = DDT.CurrentDriver.Value("Card");
         if(DDT.CurrentDriver.Value("Card")=="Visa")
         visaCard.ClickButton();
         else
         if(DDT.CurrentDriver.Value("Card")== "MasterCard")
         masterCard.ClickButton();
         else
         ae.ClickButton();
         Aliases.Group.ExpDate.wDate = DDT.CurrentDriver.Value("ExpirationDate");
         Aliases.Group.ProductNames.ClickItem(DDT.CurrentDriver.Value("Product"));
         Aliases.OrderForm.ButtonOK.ClickButton();
         Delay(500);
         aqObject.CompareProperty(Aliases.Orders.OrdersView.wSelectedItems, 0, DDT.CurrentDriver.Value("CustomerName"), false);  
  DDT.CurrentDriver.Next();
         Log.PopLogFolder(); 
                
  }
}

function editOrder(){
 DDT.CSVDriver(Files.FileNameByName("names.txt")); 
 for(var i=0;i<=4;i++){
    Log.AppendFolder("editOrder "+i);
    Aliases.Orders.MainForm.OrdersView.SelectItem(i);
    Aliases.Orders.MainForm.MainMenu.Click("Orders|Edit order..."); 
    Aliases.Group.CustomerName.wText = DDT.CurrentDriver.Value("CustomerName"); 
    Aliases.OrderForm.ButtonOK.ClickButton();
    aqObject.CompareProperty(Aliases.Orders.OrdersView.wSelectedItems, 0, DDT.CurrentDriver.Value("CustomerName"), false);  
    DDT.CurrentDriver.Next();
    Delay(500);
    Log.PopLogFolder();
 }
 }
 
 function DeleteOrder(){
Log.AppendFolder("deleting");
 for(var i = 0;i<=4;i++){
  Aliases.Orders.MainForm.MainMenu.Click("Orders|Delete order");
  Delay(500);
  Aliases.Orders.btnYes.ClickButton();
 }
 Log.PopLogFolder();
}

function Close(){
    Log.AppendFolder("close")
   Aliases.Orders.MainForm.MainMenu.Click("File|Exit");
   Aliases.Orders.btnNo.ClickButton(); 
   Log.PopLogFolder();
}
