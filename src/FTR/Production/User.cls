Class FTR.Production.User Extends %Persistent
{

Property Name As %String;

Property LastName As %String;

Property Date As %String;

Property TelegramID As %String;

Property LastMessage As %String;

Storage Default
{
<Data name="UserDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Name</Value>
</Value>
<Value name="3">
<Value>LastName</Value>
</Value>
<Value name="4">
<Value>Date</Value>
</Value>
<Value name="5">
<Value>TelegramID</Value>
</Value>
<Value name="6">
<Value>LastMessage</Value>
</Value>
</Data>
<DataLocation>^FTR.Production.UserD</DataLocation>
<DefaultData>UserDefaultData</DefaultData>
<IdLocation>^FTR.Production.UserD</IdLocation>
<IndexLocation>^FTR.Production.UserI</IndexLocation>
<StreamLocation>^FTR.Production.UserS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
