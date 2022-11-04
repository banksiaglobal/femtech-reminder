/// Check if patient exists
Class FTR.Production.Process.NotifyPatient Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='FTR.Production.Message.NotifyPatientRequest' response='FTR.Production.Message.NotifyPatientResponse' height='2000' width='2000' >
<sequence xend='200' yend='450' >
<code name='Check Notify' xpos='200' ypos='267' >
<![CDATA[ 

	Set ^zAK = request
	Set response.IsSuccess = 1
]]>
</code>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
