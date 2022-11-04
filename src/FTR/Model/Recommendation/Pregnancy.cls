/// Recommendation by age
Class FTR.Model.Recommendation.Pregnancy Extends FTR.Model.Recommendation
{

ClassMethod GetNotificationText(recommendationId As %String) As %String
{
	quit "Recommendation.Pregnancy"
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
