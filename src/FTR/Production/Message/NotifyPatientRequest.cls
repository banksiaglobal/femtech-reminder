/// Notify Patient Request
Class FTR.Production.Message.NotifyPatientRequest Extends Ens.Request
{

Property TelegramId As %String;

Property Message As %String;

Storage Default
{
<Data name="NotifyPatientRequestDefaultData">
<Subscript>"NotifyPatientRequest"</Subscript>
<Value name="1">
<Value>TelegramId</Value>
</Value>
<Value name="2">
<Value>Message</Value>
</Value>
</Data>
<DefaultData>NotifyPatientRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
