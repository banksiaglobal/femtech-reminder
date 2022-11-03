Class FTR.Production.Main Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="FTR.Production.Main" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="FTR.Production.Service.TelegramIn" Category="" ClassName="FTR.Production.Service.TelegramIn" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="Port">8443</Setting>
    <Setting Target="Adapter" Name="SSLConfig">test</Setting>
  </Item>
  <Item Name="Operation.TelegramOut" Category="" ClassName="FTR.Production.Operation.TelegramOut" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="HTTPPort">443</Setting>
    <Setting Target="Adapter" Name="HTTPServer">api.telegram.org</Setting>
    <Setting Target="Adapter" Name="SSLConfig">sslclient</Setting>
    <Setting Target="Adapter" Name="URL">/bot5328126407:AAFpgnP7WROZS0IGTOQLQrxwyJCgoo0mTZM</Setting>
  </Item>
  <Item Name="FTR.Production.Operation.FHIROut" Category="" ClassName="FTR.Production.Operation.FHIROut" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="ServiceName">FHIRR</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
  </Item>
  <Item Name="FTR.Process.CheckPatient" Category="" ClassName="FTR.Production.Process.CheckPatient" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
