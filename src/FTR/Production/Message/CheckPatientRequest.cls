Class FTR.Production.Message.CheckPatientRequest Extends Ens.Request
{

Property Name As %String;

Property LastName As %String;

Property Date As %String;

Storage Default
{
<Data name="CheckPatientRequestDefaultData">
<Subscript>"CheckPatientRequest"</Subscript>
<Value name="1">
<Value>Name</Value>
</Value>
<Value name="2">
<Value>LastName</Value>
</Value>
<Value name="3">
<Value>Date</Value>
</Value>
</Data>
<DefaultData>CheckPatientRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
