/// Notify Patient Request
Class FTR.Production.Message.NotifyPatientRequest Extends Ens.Request
{

Property PatientId As %String;

Storage Default
{
<Data name="NotifyPatientRequestDefaultData">
<Subscript>"NotifyPatientRequest"</Subscript>
<Value name="1">
<Value>PatientId</Value>
</Value>
</Data>
<DefaultData>NotifyPatientRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
