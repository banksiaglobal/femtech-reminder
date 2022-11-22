/// Description
Class FTR.Production.Operation.TelegramOut Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

/// The adapter instance
Property Adapter As EnsLib.HTTP.OutboundAdapter;

/*
bg-mn:
    send message to Telegram
*/
Method TelegramOutCall(pRequest As FTR.Production.Message.TelegramOutRequest, Output pResponse As Ens.Response) As %Status
{
    Set tURL=..Adapter.URL_"/sendMessage"_"?chat_id="_pRequest.ChatId_"&text="_pRequest.Text
      
    // Execute the call
    Set tSC=..Adapter.GetURL(tURL,.tHttpResponse)	
    Return $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="FTR.Production.Message.TelegramOutRequest">
        <Method>TelegramOutCall</Method>
    </MapItem>
  
</MapItems>
}

}
