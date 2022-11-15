/// Notification
Class FTR.Model.Notification Extends (%Library.Persistent, %ZEN.DataModel.Adaptor)
{

Property NotifyDate As %Date [ InitialExpression = {+$h} ];

Property NotifyTime As %TimeStamp [ InitialExpression = {$zdt($zts,3)} ];

Relationship Recommendation As FTR.Model.Recommendation [ Cardinality = one, Inverse = Notifications ];

Property Patient As FTR.Model.Patient;

Index PatientIndex On Patient;

Index NotifyDateIndex On NotifyDate;

Index NotifyTimeIndex On NotifyTime;

Index RecommendationIndex On Recommendation;

Storage Default
{
<Data name="NotificationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>NotifyDate</Value>
</Value>
<Value name="3">
<Value>NotifyTime</Value>
</Value>
<Value name="4">
<Value>Recommendation</Value>
</Value>
<Value name="5">
<Value>Patient</Value>
</Value>
</Data>
<DataLocation>^FTR.Model.NotificationD</DataLocation>
<DefaultData>NotificationDefaultData</DefaultData>
<ExtentSize>1</ExtentSize>
<IdLocation>^FTR.Model.NotificationD</IdLocation>
<IndexLocation>^FTR.Model.NotificationI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="NotifyDate">
<AverageFieldSize>5</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="NotifyTime">
<AverageFieldSize>21</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="Recommendation">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="NotifyDateIndex">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="NotifyTimeIndex">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="RecommendationIndex">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^FTR.Model.NotificationS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
