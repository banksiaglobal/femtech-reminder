Class FTR.Production.Utils Extends %RegisteredObject
{

ClassMethod AddUser(name, lastName, date As %String) As %String
{
        &sql(select id into :id from FTR.Production.User where name = :Name)
        if (id '=""){
                Set message = "уже есть"
        }
        else{
                Set user = ##class(FTR.Production.User).%New() 
                Set user.Name = name
                Set user.LastName = lastName
                Set user.Date = date
                set status = user.%Save()
                set message = "удачно"
        }
        return message
}

ClassMethod CheckUser(id As %String) As FTR.Production.User
{
    &sql(select id into :userId from FTR.Production.User where TelegramID = :id)
    Quit:SQLCODE=0 ##class(FTR.Production.User).%OpenId(userId)
    set User = ##class(FTR.Production.User).%New()
    set User.TelegramID = id
    do User.%Save()
    Quit User
}

}
