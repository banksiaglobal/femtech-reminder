Class FTR.Production.BusinessRule.EmailAlert Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine" production="FTR.Production.Main">
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="" disabled="false">
<when condition="1">
<send transform="" target="EmailAlert"></send>
<return></return>
</when>
</rule>
</ruleSet>
</ruleDefinition>
}

}
