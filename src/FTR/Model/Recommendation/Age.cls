/// Recommendation by age
Class FTR.Model.Recommendation.Age Extends FTR.Model.Recommendation
{

Property AgeFrom As %Integer;

Property AgeUpTo As %Integer;

/// Notification period (monthes)
Property Period As %Integer;

Storage Default
{
<Data name="AgeDefaultData">
<Subscript>"Age"</Subscript>
<Value name="1">
<Value>AgeFrom</Value>
</Value>
<Value name="2">
<Value>AgeUpTo</Value>
</Value>
<Value name="3">
<Value>Period</Value>
</Value>
</Data>
<DefaultData>AgeDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
