Class FTR.Production.Message.RouterRequest Extends Ens.Request
{

Property InterMessage As %Library.DynamicObject;

Property User As FTR.Model.Patient;

Storage Default
{
<Data name="InterMessage">
<Attribute>InterMessage</Attribute>
<Structure>node</Structure>
<Subscript>"FTR.Production.Message.RouterRequest.InterMessage"</Subscript>
</Data>
<Data name="RouterRequestDefaultData">
<Subscript>"RouterRequest"</Subscript>
<Value name="1">
<Value>User</Value>
</Value>
</Data>
<DefaultData>RouterRequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
