/// Notify Patient Request
Class FTR.Production.Message.NotifyPatientRequest Extends Ens.Request
{

Property TelegramId As %String;

Storage Default
{
<Data name="NotifyPatientRequestDefaultData">
<Subscript>"NotifyPatientRequest"</Subscript>
<Value name="1">
<Value>TelegramId</Value>
</Value>
</Data>
<DefaultData>NotifyPatientRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
