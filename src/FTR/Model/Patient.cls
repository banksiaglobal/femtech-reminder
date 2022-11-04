Class FTR.Model.Patient Extends %Persistent
{

Property Name As %String;

Property LastName As %String;

Property DOB As %Date;

Property TelegramID As %String;

Property LastMessage As %String;

Index TelegramIDIndex On TelegramID [ Unique ];

ClassMethod CheckUser(telegramId As %String) As FTR.Model.Patient
{
    &sql(select id into :userId from FTR_Model.Patient where TelegramID = :telegramId)
    Quit:SQLCODE=0 ##class(FTR.Model.Patient).%OpenId(userId)
    set User = ##class(FTR.Model.Patient).%New()
    set User.TelegramID = telegramId
    do User.%Save()
    Quit User
}

Storage Default
{
<Data name="PatientDefaultData">
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
<Value>DOB</Value>
</Value>
<Value name="5">
<Value>TelegramID</Value>
</Value>
<Value name="6">
<Value>LastMessage</Value>
</Value>
</Data>
<DataLocation>^FTR.Model.PatientD</DataLocation>
<DefaultData>PatientDefaultData</DefaultData>
<ExtentSize>4</ExtentSize>
<IdLocation>^FTR.Model.PatientD</IdLocation>
<IndexLocation>^FTR.Model.PatientI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="DOB">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="LastMessage">
<AverageFieldSize>11.5</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="LastName">
<AverageFieldSize>4.5</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="Name">
<AverageFieldSize>9.5</AverageFieldSize>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="TelegramID">
<AverageFieldSize>6</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="TelegramIDIndex">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^FTR.Model.PatientS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
