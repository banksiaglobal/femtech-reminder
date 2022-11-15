Class FTR.Model.Patient Extends (%Library.Persistent, %ZEN.DataModel.Adaptor)
{

Property Name As %String;

Property LastName As %String;

Property DOB As %Date;

Property TelegramID As %String;

Property LastMessage As %String;

Property FhirId As %String;

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
<Value name="7">
<Value>FhirId</Value>
</Value>
</Data>
<DataLocation>^FTR.Model.PatientD</DataLocation>
<DefaultData>PatientDefaultData</DefaultData>
<ExtentSize>16</ExtentSize>
<IdLocation>^FTR.Model.PatientD</IdLocation>
<IndexLocation>^FTR.Model.PatientI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,16,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000"),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,21),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,1,0,$lb(2,3,4,18,19,20,38,39,40,41,42,43,44,45,46,47),$lb(0,0,0,1,0,0,1,0,1,1,1,1,1,1,1),$lb(838860800,838860800,855638016,855638016,872415232,872415232,825753600,939524096,956301312,825819136,842006528,842006528,859308032,939524096,956301312,859373568,875560960,805306368,822083584,822083584,838860800,838860800,855638016,855638016,872415232,872415232,889192448,889192448,905969664,905969664,922746880,876019712))</Histogram>
<Selectivity>1</Selectivity>
</Property>
<Property name="DOB">
<AverageFieldSize>2.13</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,15,$lb("-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000","-10000000000000000000",60226),$lb(21,21,21,21,21,21,21,21,21,21,21,21,21,21,0),$lb(758198320,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,758198320,909128242,909128242))</Histogram>
<OutlierSelectivity>.9375:</OutlierSelectivity>
<Selectivity>6.2500%</Selectivity>
</Property>
<Property name="FhirId">
<AverageFieldSize>2</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," "),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,536870912))</Histogram>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="LastMessage">
<AverageFieldSize>4.81</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," /AFTER"," /REGISTRATION"," /REGISTRATION"," /REGISTRATION"),$lb(2,2,2,2,2,2,2,2,2,2,2,1,2,15,15),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,792806996,1095128133,1380271945,0,0,0,0,539972165))</Histogram>
<OutlierSelectivity>.75:</OutlierSelectivity>
<Selectivity>12.5000%</Selectivity>
</Property>
<Property name="LastName">
<AverageFieldSize>2.44</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," "," "," VASILII"),$lb(2,2,2,2,2,2,2,2,2,2,2,2,2,2,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1447121737,542523731))</Histogram>
<OutlierSelectivity>.9375:</OutlierSelectivity>
<Selectivity>6.2500%</Selectivity>
</Property>
<Property name="Name">
<AverageFieldSize>3.63</AverageFieldSize>
<Histogram>$lb(.06666666666666666667,0,0,$lb(" "," "," "," "," "," "," "," "," "," "," "," "," "," /HELP"," MULLER251"," ПРИВЕТ"),$lb(2,2,2,2,2,2,2,2,2,2,2,2,1,1,1),$lb(536870912,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,793265484,793265484,1297435724,1297435724,3500134560,550543312))</Histogram>
<OutlierSelectivity>.8125:</OutlierSelectivity>
<Selectivity>6.2500%</Selectivity>
</Property>
<Property name="TelegramID">
<AverageFieldSize>3.69</AverageFieldSize>
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
