Class FTR.Production.Message.CheckPatientResponse Extends Ens.Request
{

Property IsPatientFound As %Boolean;

Property Patient As %Library.DynamicObject;

Storage Default
{
<Data name="CheckPatientResponseDefaultData">
<Subscript>"CheckPatientResponse"</Subscript>
<Value name="1">
<Value>IsPatientFound</Value>
</Value>
</Data>
<Data name="Patient">
<Attribute>Patient</Attribute>
<Structure>node</Structure>
<Subscript>"FTR.Production.Message.CheckPatientResponse.Patient"</Subscript>
</Data>
<DefaultData>CheckPatientResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
