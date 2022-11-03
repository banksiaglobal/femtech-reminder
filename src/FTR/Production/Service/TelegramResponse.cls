Class FTR.Production.Service.TelegramResponse Extends Ens.Response
{

Property JSONResponse As %String(MAXLEN = 5000);

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
