Class FTR.Production.Message.TelegramResponse Extends Ens.Response
{

Property JSONResponse As %String(MAXLEN = "");

Storage Default
{
<Data name="TelegramResponseDefaultData">
<Subscript>"TelegramResponse"</Subscript>
<Value name="1">
<Value>JSONResponse</Value>
</Value>
</Data>
<DefaultData>TelegramResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
