Class FTR.Production.Process.TelegramProcess Extends Ens.BusinessProcess
{

Method OnRequest(pRequest As Ens.Request, Output pResponse As Ens.Response) As %Status
{
    Return $$$OK
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
