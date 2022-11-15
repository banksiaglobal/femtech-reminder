/// Common class of recommendation
Class FTR.Model.Recommendation Extends (%Library.Persistent, %ZEN.DataModel.Adaptor)
{

/// Notification description
Property Description As %String(MAXLEN = "");

/// Notification source
Property Source As %String(MAXLEN = "");

/// Sended Notifications
Relationship Notifications As FTR.Model.Notification [ Cardinality = many, Inverse = Recommendation ];

/// Notification text
Property NotificationText As %String [ Calculated, SqlComputeCode = {
	If {ID}="" {
		Set {NotificationText}=""
	} else {
		Set classname=$s({x__classname}'="":$p({x__classname},"~",$l({x__classname},"~")-1),1:{%%CLASSNAMEQ})
		Set {NotificationText} = $classmethod(classname,"GetNotificationText",{ID})
	}	
}, SqlComputed ];

ClassMethod GetNotificationText(recommendationId As %String) As %String
{
	&sql(SELECT Description INTO :text FROM FTR_Model.Recommendation WHERE ID = :recommendationId)
	quit:SQLCODE=0 text
	quit ""
}

/// d ##class(FTR.Model.Recommendation).ImitateApointment()
Storage Default
{
<Data name="RecommendationDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Description</Value>
</Value>
<Value name="3">
<Value>Source</Value>
</Value>
</Data>
<DataLocation>^FTR.Model.RecommendationD</DataLocation>
<DefaultData>RecommendationDefaultData</DefaultData>
<Description>
<![CDATA[d ##class(FTR.Model.Recommendation).ImitateApointment()]]></Description>
<ExtentSize>1</ExtentSize>
<IdLocation>^FTR.Model.RecommendationD</IdLocation>
<IndexLocation>^FTR.Model.RecommendationI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>32</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Description">
<AverageFieldSize>9</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="NotificationText">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="Source">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^FTR.Model.RecommendationS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
