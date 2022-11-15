/// Description
Class FTR.Production.Operation.TelegramOutNotification Extends FTR.Production.Operation.TelegramOutRequest
{

Property ReplyMarkup As %String(MAXLEN = "");

Storage Default
{
<Data name="TelegramOutNotificationDefaultData">
<Subscript>"TelegramOutNotification"</Subscript>
<Value name="1">
<Value>ReplyMarkup</Value>
</Value>
</Data>
<DefaultData>TelegramOutNotificationDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
