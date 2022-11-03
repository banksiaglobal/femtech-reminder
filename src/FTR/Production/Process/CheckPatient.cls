/// Check if patient exists
Class FTR.Production.Process.CheckPatient Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='FTR.Production.Message.CheckPatientRequest' response='FTR.Production.Message.CheckPatientResponse' height='2000' width='2000' >
<sequence xend='200' yend='450' >
<call name='Find a patient in FHIR' target='FTR.Production.Operation.FHIROut' async='1' xpos='200' ypos='250' >
<request type='HS.FHIRServer.Interop.Request' >
<assign property="callrequest.Request.RequestMethod" value="&quot;GET&quot;" action="set" />
<assign property="callrequest.Request.RequestPath" value="&quot;/Patient&quot;" action="set" />
<assign property="callrequest.Request.QueryString" value="&quot;&amp;name=&quot;_request.Name" action="set" />
</request>
<response type='HS.FHIRServer.Interop.Response' >
<assign property="response.IsPatientFound" value="{}.%FromJSON(##class(HS.SDA3.QuickStream).%OpenId(callresponse.QuickStreamId)).total=1" action="set" />
</response>
</call>
<sync name='Wait for response' calls='Find a patient in FHIR' type='all' xpos='200' ypos='350' />
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
