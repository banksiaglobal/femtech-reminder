Class FTR.Production.Message.TelegramOutRequest Extends Ens.Request
{

Property ChatId As %String;

Property Text As %String(MAXLEN = 2500);

Storage Default
{
<Data name="TelegramOutRequestDefaultData">
<Subscript>"TelegramOutRequest"</Subscript>
<Value name="1">
<Value>ChatId</Value>
</Value>
<Value name="2">
<Value>Text</Value>
</Value>
</Data>
<DefaultData>TelegramOutRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
