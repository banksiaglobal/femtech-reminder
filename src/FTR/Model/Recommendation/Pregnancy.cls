/// Recommendation by age
Class FTR.Model.Recommendation.Pregnancy Extends FTR.Model.Recommendation
{

Property Week As %Integer;

/*ClassMethod GetNotificationText(recommendationId As %String) As %String
{
	quit "Recommendation.Pregnancy"
}
*/
Storage Default
{
<Data name="PregnancyDefaultData">
<Subscript>"Pregnancy"</Subscript>
<Value name="1">
<Value>Week</Value>
</Value>
</Data>
<DefaultData>PregnancyDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
