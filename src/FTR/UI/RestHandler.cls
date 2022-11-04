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
	Set response = []
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
				Do response.%Push(tPatientInfo)
			}
		}
	}
	Quit ..Response(response)
}

ClassMethod GetRecommendationAgeList() As %Library.DynamicObject
{
	Set response = {}
	Set response.recommendations = []
	Set csql = "select Description from FTR_Model_Recommendation.Age"
	Set tcStatement = ##class(%SQL.Statement).%New()
	Set tcStatus = tcStatement.%Prepare(csql)
	If ($$$ISOK(tcStatus)) { 
		Set tcResult = tcStatement.%Execute()
		If (tcResult.%SQLCODE=0) {
			While tcResult.%Next() {
				Do response.recommendations.%Push(tcResult.Description)
			}
		}
	}
	Quit ..Response(response)
}

ClassMethod SetRecommendationAge() As %Status
{
	Set json = %request.Content
	
	Set csql = "insert into FTR_Model_Recommendation.Age (AgeFrom, AgeUpTo, Description) values (20, 30, 'Test2')"
	Set tcStatement = ##class(%SQL.Statement).%New()
	Set tcStatus = tcStatement.%Prepare(csql)
	Return $$$OK
}

}
