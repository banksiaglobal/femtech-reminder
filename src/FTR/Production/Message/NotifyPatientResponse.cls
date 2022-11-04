/// Notify Patient Response
Class FTR.Production.Message.NotifyPatientResponse Extends Ens.Request
{

Property IsSuccess As %Boolean;

Storage Default
{
<Data name="NotifyPatientResponseDefaultData">
<Subscript>"NotifyPatientResponse"</Subscript>
<Value name="1">
<Value>IsSuccess</Value>
</Value>
</Data>
<DefaultData>NotifyPatientResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
