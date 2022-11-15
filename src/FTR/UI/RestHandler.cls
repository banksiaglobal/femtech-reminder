Class FTR.UI.RestHandler Extends %CSP.REST
{

Parameter HandleCorsRequest As Integer = 1;

Parameter CHARSET = "UTF-8";

Parameter UseSession As BOOLEAN = 1;

XData UrlMap
{
<Routes>
<Route Url="/patient"	Method="GET"	Call="GetPatient"/>
<Route Url="/recommendation-age"	Method="GET"	Call="GetRecommendationAgeList"/>
<Route Url="/recommendation-age"	Method="POST"	Call="SetRecommendationAge"/>
<Route Url="/get-log"	Method="GET"	Call="GetLog"/>
</Routes>
}

ClassMethod Response(pResponse = "", pSC = 1) As %Status
{
	Set %response.ContentType = "application/json"
	If $$$ISERR(pSC) {
        set %response.Status = 500
		Do $SYSTEM.OBJ.DisplayError(pSC)
		Quit $$$OK
	}
    If $isobject(pResponse) {
        If pResponse.%IsA("%DynamicAbstractObject") {
            Do pResponse.%ToJSON()
        } Else {
			// We don't support any other object types, so just write it as string to help with debugging
            Write pResponse
        }
    } Else {
       Write pResponse 
    }
	Quit $$$OK
}

/// Description
ClassMethod GetPatient() As %Library.DynamicObject
{
	Set response = {}
	Set response.patients = []
	Set csql = "select Name, LastName, DOB, TelegramID from FTR_Model.Patient"
	Set tcStatement = ##class(%SQL.Statement).%New()
	Set tcStatus = tcStatement.%Prepare(csql)
	If ($$$ISOK(tcStatus)) { 
		Set tcResult = tcStatement.%Execute()
		If (tcResult.%SQLCODE=0) {
			While tcResult.%Next() {
				Set tPatientInfo = {
					"name" : (tcResult.Name),
					"lastName" : (tcResult.LastName),
                    "birthdayDate" : (tcResult.DOB),
                    "telegramID" : (tcResult.TelegramID)
				}
				Do response.patients.%Push(tPatientInfo)
			}
		}
	}
	Quit ..Response(response)
}

ClassMethod GetRecommendationAgeList() As %Library.DynamicObject
{
	Set response = {}
	Set response.recommendations = []
	Set csql = "select ID,Description, Source, AgeFrom, AgeUpTo, Period  from FTR_Model_Recommendation.Age"
	Set tcStatement = ##class(%SQL.Statement).%New()
	Set tcStatus = tcStatement.%Prepare(csql)
	If ($$$ISOK(tcStatus)) { 
		Set tcResult = tcStatement.%Execute()
		If (tcResult.%SQLCODE=0) {
			While tcResult.%Next() {
				Set recommendation = {}
				Set recommendation.id = tcResult.ID
				Set recommendation.description = tcResult.Description
				Set recommendation.source = tcResult.Source
				Set recommendation.ageFrom = tcResult.AgeFrom
				Set recommendation.ageUpTo = tcResult.AgeUpTo
				Set recommendation.period = tcResult.Period
				Do response.recommendations.%Push(recommendation)
			}
		}
	}
	Quit ..Response(response)
}

// select recommendation -> NotificationText from FTR_Model.Notification

ClassMethod GetLog() As %Library.DynamicObject
{
	Set response = {}
	Set response.notifications = []
	Set csql = "select *, recommendation -> NotificationText, patient->Name from FTR_Model.Notification order by id desc"
	Set tcStatement = ##class(%SQL.Statement).%New()
	Set tcStatus = tcStatement.%Prepare(csql)
	If ($$$ISOK(tcStatus)) { 
		Set tcResult = tcStatement.%Execute()
		If (tcResult.%SQLCODE=0) {
			While tcResult.%Next() {
				Set notification = {}
				Set notification.id = tcResult.ID
				Set notification.recommendation = tcResult.NotificationText
				Set notification.notifyTime = tcResult.NotifyTime
				Set notification.patient = tcResult.Name
				Do response.notifications.%Push(notification)
			}
		}
	}
	Quit ..Response(response)
}

ClassMethod SetRecommendationAge() As %Library.DynamicObject
{
	Set json = {}.%FromJSON(%request.Content)
	&sql(select id into :recommendationId from FTR_Model_Recommendation.Age where ID = :json.id)
	If SQLCODE=0 {
    	set Recommendation = ##class(FTR.Model.Recommendation.Age).%OpenId(recommendationId)
	} else {
    	set Recommendation = ##class(FTR.Model.Recommendation.Age).%New()
	}
	Set Recommendation.AgeFrom = json.ageFrom
	Set Recommendation.AgeUpTo = json.ageUpTo
	Set Recommendation.Description = json.description
	Set Recommendation.Source = json.source
	Set Recommendation.Period = json.period
	
	Set tSC = Recommendation.%Save()
	Set response = {}
	Set response.status = 1
	Set response.recommendation = {}
	Set response.recommendation.id = Recommendation.%Id()
	Set response.recommendation.description = Recommendation.Description
	Set response.recommendation.source = Recommendation.Source
	Set response.recommendation.ageForm = Recommendation.AgeFrom
	Set response.recommendation.ageUpTo = Recommendation.AgeUpTo
	Set response.recommendation.period = Recommendation.Period
		
	Quit ..Response(response)
}

}
