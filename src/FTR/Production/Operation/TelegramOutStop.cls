Class FTR.Production.Operation.TelegramOutStop Extends FTR.Production.Operation.TelegramOutRequest
{

Property PatientId As %String;

Storage Default
{
<Data name="TelegramOutStopDefaultData">
<Subscript>"TelegramOutStop"</Subscript>
<Value name="1">
<Value>PatientId</Value>
</Value>
</Data>
<DefaultData>TelegramOutStopDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
