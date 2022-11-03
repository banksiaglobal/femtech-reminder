Class FTR.Production.Process.Router Extends Ens.Alerting.BaseProcess
{

Property Processed As %Boolean [ InitialExpression = 0 ];

Parameter RuleAssistClass = "EnsLib.MsgRouter.VDocRuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleSet name="Revenue Cycle Management Router" effectiveBegin="" effectiveEnd="">
<rule name="DHPO Claim.Submission" disabled="false">
</rule>
</ruleSet>
}

Storage Default
{
<Data name="RouterDefaultData">
<Subscript>"Router"</Subscript>
<Value name="1">
<Value>Processed</Value>
</Value>
</Data>
<DefaultData>RouterDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
