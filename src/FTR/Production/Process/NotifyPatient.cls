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

	// Получить карту FHIR
	
	// Выбрать рекомендации для пациента
	// - Подходит по условиям (возраст, неделя беременности, диагноз и т.п.)
	// - Не была отправлена в течение периода отправки (если он есть)
	// - у пациента не было уведомлений в течение суток (настройка?) 

	Set tRequest = ##class(HS.FHIRServer.Interop.Request).%New()
	Set tRequest.Request.RequestMethod = "GET"
	Set tRequest.Request.RequestPath = "/Patient/"_request.PatientId
	
	
	set tSC = %this.SendRequestSync("Operation.FHIROut",tRequest,.tResponse) 

	Set ^zAK = tResponse
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
