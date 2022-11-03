Class FTR.Model.User Extends %Persistent
{

Property Name As %String;

Property LastName As %String;

Property Date As %String;

Property TelegramID As %String;

Property LastMessage As %String;

ClassMethod CheckUser(telegramId As %String) As FTR.Model.User
{
    &sql(select id into :userId from FTR_Model."User" where TelegramID = :telegramId)
    Quit:SQLCODE=0 ##class(FTR.Model.User).%OpenId(userId)
    set User = ##class(FTR.Model.User).%New()
    set User.TelegramID = telegramId
    do User.%Save()
    Quit User
}

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
<DataLocation>^FTR.Model.UserD</DataLocation>
<DefaultData>UserDefaultData</DefaultData>
<IdLocation>^FTR.Model.UserD</IdLocation>
<IndexLocation>^FTR.Model.UserI</IndexLocation>
<StreamLocation>^FTR.Model.UserS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
