/// Description
Class FTR.Production.Message.CheckPatientResponse Extends Ens.Request
{

Property IsPatientFound As %Boolean;

Property FhirId As %String;

Storage Default
{
<Data name="CheckPatientResponseDefaultData">
<Subscript>"CheckPatientResponse"</Subscript>
<Value name="1">
<Value>IsPatientFound</Value>
</Value>
<Value name="2">
<Value>FhirId</Value>
</Value>
</Data>
<DefaultData>CheckPatientResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
