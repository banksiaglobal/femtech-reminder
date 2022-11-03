/// Description
Class FTR.Production.Operation.TelegramOut Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

/// The adapter instance
Property Adapter As EnsLib.HTTP.OutboundAdapter;

Method TelegramOutCall(pRequest As FTR.Production.Operation.TelegramOutRequest, Output pResponse As Ens.Response) As %Status
{
   Set tURL=..Adapter.URL_"/sendMessage"_"?chat_id="_pRequest.ChatId_"&text="_pRequest.Text
      
   // Execute the call
   Set tSC=..Adapter.GetURL(tURL,.tHttpResponse)	
   Return $$$OK
}

/// Description
Method TelegramStop() As %Status
{
    Set tURL=..Adapter.URL_"/stopPoll"
    Set tSC=..Adapter.GetURL(tURL,.tHttpResponse)
    Return $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="FTR.Production.Operation.TelegramOutRequest">
        <Method>TelegramOutCall</Method>

    </MapItem>
    <MapItem MessageType="FTR.Production.Operation.TelegramOutStop">
        <Method>TelegramStop</Method>
        
    </MapItem>
</MapItems>
}

}
