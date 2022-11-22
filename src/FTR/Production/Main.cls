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
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="Ens.Alert" Category="" ClassName="EnsLib.MsgRouter.RoutingEngine" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="Validation"></Setting>
    <Setting Target="Host" Name="BusinessRuleName">FTR.Production.BusinessRule.Alert</Setting>
  </Item>
  <Item Name="Operation.TelegramOut" Category="" ClassName="FTR.Production.Operation.TelegramOut" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="HTTPPort">443</Setting>
    <Setting Target="Adapter" Name="HTTPServer">api.telegram.org</Setting>
    <Setting Target="Adapter" Name="SSLConfig">sslclient</Setting>
    <Setting Target="Adapter" Name="URL">/bot5328126407:AAFpgnP7WROZS0IGTOQLQrxwyJCgoo0mTZM</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="FTR.Production.Operation.FHIROut" Category="" ClassName="FTR.Production.Operation.FHIROut" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="ServiceName">FHIRR</Setting>
    <Setting Target="Host" Name="ArchiveIO">1</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
    <Setting Target="Host" Name="XApiKey">EQXEZ5l0V45V2X7xGQr5O7gb0p5vLy7d7WYWzVZB</Setting>
  </Item>
  <Item Name="FTR.Process.CheckPatient" Category="" ClassName="FTR.Production.Process.CheckPatient" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="FTR.Production.Process.NotifyPatient" Category="" ClassName="FTR.Production.Process.NotifyPatient" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
  <Item Name="FTR.Production.Process.TelegramRouter" Category="" ClassName="FTR.Production.Process.TelegramRouter" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="FTR.Production.Service.Notify" Category="" ClassName="FTR.Production.Service.Notify" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="true" Schedule="">
    <Setting Target="Adapter" Name="CallInterval">86400</Setting>
    <Setting Target="Host" Name="AlertOnError">1</Setting>
  </Item>
</Production>
}

}
